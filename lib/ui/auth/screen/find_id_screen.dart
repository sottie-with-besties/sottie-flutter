import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/auth/phone_verification.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  int currentStep = 0;
  String? phoneNumber = '';
  String? verificationCode = '';

  bool isNextLoading = false;
  bool isCancelLoading = false;

  final phoneNumberKey = GlobalKey<FormState>();

  final loadingCircle = const Center(
    child: CircularProgressIndicator(
      color: mainSilverColor,
    ),
  );

  bool _anyButtonLoading() {
    return isNextLoading || isCancelLoading;
  }

  StepState _setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void _onStepTapped(step) {
    setState(() {
      currentStep = step;
    });
  }

  void _onStepContinue() async {
    isNextLoading = true;
    setState(() {});

    if (currentStep == 0) {
      if (phoneNumberKey.currentState!.validate()) {
        final errorCode = await signInWithPhoneNumber(phoneNumber!);
        if (errorCode == null) {
          currentStep += 1;
          setState(() {});
        } else {
          if (mounted) showSnackBar(context, errorCode);
        }
      }
    } else if (currentStep == 1) {
      final errorCode = await signInWithSmsCode(verificationCode!);
      if (errorCode == null) {
        currentStep += 1;
        setState(() {});
      } else {
        if (mounted) showSnackBar(context, errorCode);
      }
    }
    isNextLoading = false;
    setState(() {});
  }

  void _onStepCancel() async {
    if (currentStep == 0) {
      context.pop();
    } else if (currentStep == 2) {
      isCancelLoading = true;
      setState(() {});
      await deletePhoneUser(phoneNumber!);
      currentStep -= 1;
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
                key: phoneNumberKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "전화번호를 입력해주세요",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextField(
                      hint: "전화번호 입력",
                      validator: (val) {
                        phoneNumber = val;
                        return validatePhoneNumber(val!);
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
                    "문자를 확인하세요!",
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
                      verificationCode = val;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final errorCode =
                          await signInWithPhoneNumber(phoneNumber!);
                      if (errorCode != null) {
                        if (context.mounted) showSnackBar(context, errorCode);
                      }
                    },
                    child: const Text("인증코드 재전송"),
                  ),
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
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "이메일 정보",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "jinpyokim13423@naver.com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainBrownColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: const Size(100, 60),
                          ),
                          onPressed: () {
                            context.go(CustomRouter.authPath);
                          },
                          child: const Text(
                            "확인",
                            style: TextStyle(
                                color: mainSilverColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () =>
                        _anyButtonLoading() ? null : _onStepCancel(),
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
                  if (currentStep < 2)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBrownColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () =>
                          _anyButtonLoading() ? null : _onStepContinue(),
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
