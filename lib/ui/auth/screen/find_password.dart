import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/auth/email_verification.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({super.key});

  @override
  State<FindPasswordScreen> createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  final _dummyPassword = "sottiepassword1027!@#";

  int currentStep = 0;
  String? password = '';

  String? email = '';

  bool isNextLoading = false;
  bool isCancelLoading = false;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmFocusNode = FocusNode();

  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  final loadingCircle = const Center(
    child: CircularProgressIndicator(
      color: mainWhiteSilverColor,
    ),
  );

  bool _anyButtonLoading() {
    return isNextLoading || isCancelLoading;
  }

  StepState _setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void _onStepContinue() async {
    isNextLoading = true;
    setState(() {});

    if (currentStep == 0) {
      /// 파이어베이스에 이메일 및 비밀번호 등록
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
        currentStep += 1;
      } else {
        if (mounted) showSnackBar(context, "이메일을 인증해주세요");
      }
      isNextLoading = false;
      setState(() {});
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
      /// 비밀번호 변경 화면 -> 뒤로 가기 했을 때 번호 인증 화면으로 가지 않고 이메일 입력 화면으로 넘어간다.
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
                        "이메일을 입력해주세요",
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
                        hint: "이메일 입력",
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
                        "비밀번호를 재설정해주세요",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (passwordKey.currentState!.validate()) {
                                  showCustomDialog(
                                    context,
                                    const Text("비밀번호를 변경하시겠습니까?"),
                                    extraButton: ElevatedButton(
                                      onPressed: _anyButtonLoading()
                                          ? null
                                          : () async {
                                              isNextLoading = true;
                                              setState(() {});
                                              // Todo: 백엔드로 정보 수정 알림 보내야함
                                              if (context.mounted) {
                                                showSnackBar(
                                                    context, '비밀번호를 변경하였습니다.');
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                context.pop();
                                              }
                                              isNextLoading = false;
                                              setState(() {});
                                            },
                                      child: const Text("변경"),
                                    ),
                                  );
                                }
                              },
                              child: const Text("비밀번호 재설정하기"),
                            ),
                          ),
                        ],
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
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () =>
                          _anyButtonLoading() ? null : _onStepCancel(),
                      child:
                          isCancelLoading ? loadingCircle : const Text("뒤로가기"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (currentStep < 2)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                        ),
                        onPressed: () =>
                            _anyButtonLoading() ? null : _onStepContinue(),
                        child: isNextLoading ? loadingCircle : const Text("다음"),
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
