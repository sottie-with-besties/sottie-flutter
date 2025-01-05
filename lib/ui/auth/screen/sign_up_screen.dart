import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/provider/auth/email_verification.dart';
import 'package:sottie_flutter/provider/auth/sign_up_entity.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _dummyPassword = "sottiepassword1027!@#";

  int currentStep = 0;
  String? email;
  String? password;

  bool isNextLoading = false;
  bool isCancelLoading = false;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmFocusNode = FocusNode();

  bool _anyButtonLoading() {
    return isNextLoading || isCancelLoading;
  }

  final loadingCircle = const Center(
    child: CircularProgressIndicator(
      color: mainWhiteSilverColor,
    ),
  );

  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  StepState _setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void _onStepContinue() async {
    if (currentStep == 0) {
      /// 파이어베이스에 이메일 등록 및 인증 메일 전송
      if (emailKey.currentState!.validate()) {
        if (email != null) {
          isNextLoading = true;
          setState(() {});
          String? errorCode =
              await createEmailAndPassword(email!, _dummyPassword);
          if (mounted) {
            if (errorCode == null) {
              currentStep += 1;
              await sendEmailVerification();
            } else {
              showSnackBar(context, errorCode);
            }
          }
          isNextLoading = false;
          setState(() {});
        }
      }
    } else if (currentStep == 1) {
      /// 이메일 인증 화면 -> 이메일 인증 성공 후 파이어베이스 유저 이메일 정보 삭제
      isNextLoading = true;
      setState(() {});
      final emailVerification =
          await isEmailVerification(email!, _dummyPassword);
      if (emailVerification) {
        await deleteEmailUser(email!, _dummyPassword);
        emailSignUpEntity.email = email!;
        currentStep += 1;
      } else {
        if (mounted) showSnackBar(context, "이메일을 인증해주세요");
      }
      isNextLoading = false;
      setState(() {});
    } else if (currentStep == 2) {
      if (passwordKey.currentState!.validate()) {
        emailSignUpEntity.password = password!;
        context.push(
          '${CustomRouter.authPath}/${CustomRouter.certificationPath}',
          extra: {
            'isModifyInfo': false,
          },
        );
      }
    }
  }

  void _onStepCancel() async {
    if (currentStep == 0) {
      context.pop();
    } else if (currentStep == 1) {
      /// 이메일 인증 스크린에서 뒤로가기 했을 경우
      isCancelLoading = true;
      setState(() {});
      final String? errorCode = await deleteEmailUser(email!, _dummyPassword);
      if (errorCode == null) {
        currentStep -= 1;
      } else {
        if (mounted) showSnackBar(context, errorCode);
      }
      isCancelLoading = false;
      setState(() {});
    } else if (currentStep == 2) {
      currentStep -= 2;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
        _passwordConfirmFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stepper(
            elevation: 1,
            type: StepperType.horizontal,
            currentStep: currentStep,
            connectorColor: WidgetStateColor.resolveWith(
              (state) {
                if (state.contains(WidgetState.selected)) {
                  return mainBlueColor;
                }
                return mainGreyColor;
              },
            ),
            steps: <Step>[
              Step(
                title: Container(),
                content: Form(
                  key: emailKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "이메일을 생성해주세요",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthTextField(
                        focusNode: _emailFocusNode,
                        hint: "이메일을 입력해주세요.",
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          email = val;
                          return validateEmail(val!);
                        },
                      ),
                    ],
                  ),
                ),
                isActive: currentStep > 0,
                state: _setStepState(0),
              ),
              Step(
                title: Container(),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "이메일을 확인하세요!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "인증코드를 발송하였습니다. 이메일을 인증 하신 후 다음 버튼을 눌러주세요.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          await sendEmailVerification();
                        },
                        child: const Text("이메일 인증 재발송")),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                isActive: currentStep > 1,
                state: _setStepState(1),
              ),
              Step(
                title: Container(),
                content: Form(
                  key: passwordKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "비밀번호를 생성해주세요",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthTextField(
                        focusNode: _passwordFocusNode,
                        obscure: true,
                        hint: "특수문자, 대소문자, 숫자 포함 8~15자",
                        validator: (val) {
                          password = val;
                          return validatePassword(val!);
                        },
                      ),
                      AuthTextField(
                        focusNode: _passwordConfirmFocusNode,
                        obscure: true,
                        hint: "한번 더 입력해주세요",
                        validator: (val) => confirmPassword(
                          val!,
                          password!,
                        ),
                      ),
                    ],
                  ),
                ),
                isActive: currentStep > 2,
                state: _setStepState(2),
              ),
            ],
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainGreyColor,
                      ),
                      onPressed: _anyButtonLoading() ? null : _onStepCancel,
                      child: isCancelLoading
                          ? loadingCircle
                          : const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _anyButtonLoading() ? null : _onStepContinue,
                      child: isNextLoading
                          ? loadingCircle
                          : const Text(
                              "다음",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainWhiteSilverColor,
                              ),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
