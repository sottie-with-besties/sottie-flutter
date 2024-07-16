import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/auth/email_verification.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;
  String? email;
  String? password;

  bool isNextLoading = false;
  bool isCancelLoading = false;

  bool _anyButtonLoading() {
    return isNextLoading || isCancelLoading;
  }

  final loadingCircle = const Center(
    child: CircularProgressIndicator(
      color: mainSilverColor,
    ),
  );

  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  StepState _setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void _onStepTapped(step) {
    setState(() {
      currentStep = step;
    });
  }

  void _onStepContinue() async {
    if (currentStep == 0) {
      if (emailKey.currentState!.validate()) {
        currentStep += 1;
        setState(() {});
      }
    } else if (currentStep == 1) {
      // 파이어베이스에 이메일 및 비밀번호 등록
      if (passwordKey.currentState!.validate()) {
        if (email != null && password != null) {
          isNextLoading = true;
          setState(() {});
          String? errorCode = await createEmailAndPassword(email!, password!);
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
    } else if (currentStep == 2) {
      isNextLoading = true;
      setState(() {});
      final emailVerification = await isEmailVerification(email!, password!);
      if (emailVerification) {
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
    } else if (currentStep == 2) {
      isCancelLoading = true;
      setState(() {});
      final String? errorCode = await deleteEmailUser(email!, password!);
      if (errorCode == null) {
        currentStep -= 1;
      } else {
        if (mounted) showSnackBar(context, errorCode);
      }
      isCancelLoading = false;
      setState(() {});
    } else {
      currentStep -= 1;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stepper(
          elevation: 1,
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepTapped: _onStepTapped,
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
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
                      hint: "이메일을 입력해주세요.",
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
                      obsecure: true,
                      hint: "특수문자, 대소문자, 숫자 포함 8~15자",
                      validator: (val) {
                        password = val;
                        return validatePassword(val!);
                      },
                    ),
                    AuthTextField(
                      obsecure: true,
                      hint: "한번 더 입력해주세요",
                      validator: (val) => confirmPassword(
                        val!,
                        password!,
                      ),
                    ),
                  ],
                ),
              ),
              isActive: currentStep > 1,
              state: _setStepState(1),
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
              isActive: currentStep > 2,
              state: _setStepState(2),
            ),
            Step(
              title: Container(),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "본인인증을 진행해주세요!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBrownColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(100, 80),
                    ),
                    onPressed: () {
                      context.push('/auth/${CustomRouter.certificationPath}');
                    },
                    child: const Text(
                      "본인인증 하기",
                      style: TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              isActive: currentStep > 3,
              state: _setStepState(3),
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
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: _anyButtonLoading() ? null : _onStepCancel,
                    child: isCancelLoading
                        ? loadingCircle
                        : const Text(
                            "뒤로가기",
                            style: TextStyle(
                              color: mainSilverColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  if (currentStep < 3)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBrownColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: _anyButtonLoading() ? null : _onStepContinue,
                      child: isNextLoading
                          ? loadingCircle
                          : const Text(
                              "다음",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainSilverColor,
                              ),
                            ),
                    ),
                ],
              ),
            );
          },
          connectorColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.selected)) {
              return mainBrownColor;
            }
            return Colors.grey;
          }),
        ),
      ),
    );
  }
}
