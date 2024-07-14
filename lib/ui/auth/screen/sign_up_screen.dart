import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;
  String confirmPw = '';

  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  StepState setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void onStepTapped(step) {
    setState(() {
      currentStep = step;
    });
  }

  void onStepContinue() {
    if (currentStep == 0) {
      emailKey.currentState!.validate() ? currentStep += 1 : null;
      // Todo: 서버에서 이메일 인증코드 보내야함
    } else if (currentStep == 1) {
      currentStep += 1;
      // Todo: 서버에서 보낸 인증코드와 비교하여 분기 처리
    } else if (currentStep == 2) {
      passwordKey.currentState!.validate() ? currentStep += 1 : null;
    }
    setState(() {});
  }

  void onStepCancle() {
    if (currentStep == 0) {
      context.pop();
    } else {
      setState(() {
        currentStep -= 1;
      });
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
          onStepTapped: onStepTapped,
          onStepContinue: onStepContinue,
          onStepCancel: onStepCancle,
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
                      validator: (val) => validateEmail(val!),
                    ),
                  ],
                ),
              ),
              isActive: currentStep > 0,
              state: setStepState(0),
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
                    "인증코드를 발송하였습니다",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    length: 6,
                    obscureText: true,
                    validator: (val) {
                      return "코드가 일치하지 않습니다.";

                      // Todo: 서버에서 보낸 인증코드와 비교
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              isActive: currentStep > 1,
              state: setStepState(1),
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
                        confirmPw = val!;
                        return validatePassword(val);
                      },
                    ),
                    AuthTextField(
                      obsecure: true,
                      hint: "한번 더 입력해주세요",
                      validator: (val) => confirmPassword(
                        val!,
                        confirmPw,
                      ),
                    ),
                  ],
                ),
              ),
              isActive: currentStep > 2,
              state: setStepState(2),
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
                    height: 10,
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              isActive: currentStep > 3,
              state: setStepState(3),
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
                    onPressed: () => onStepCancle(),
                    child: const Text(
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
                      onPressed: () => onStepContinue(),
                      child: const Text(
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
