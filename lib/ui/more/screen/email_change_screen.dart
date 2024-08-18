import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/auth/email_verification.dart';
import 'package:sottie_flutter/domain/auth/phone_verification.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

class EmailChangeScreen extends StatefulWidget {
  const EmailChangeScreen({super.key});

  @override
  State<EmailChangeScreen> createState() => _EmailChangeScreenState();
}

class _EmailChangeScreenState extends State<EmailChangeScreen> {
  int currentStep = 0;
  String? email;
  // 이메일만 다루기 때문에 비밀번호는 더미로 계정 생성한다.
  String dummyPassword = "sottie8452!^#@!";

  String? phoneNumber = '';
  String? verificationCode = '';

  bool isNextLoading = false;
  bool isCancelLoading = false;

  final emailKey = GlobalKey<FormState>();
  final phoneNumberKey = GlobalKey<FormState>();

  bool _anyButtonLoading() {
    return isNextLoading || isCancelLoading;
  }

  final loadingCircle = const Center(
    child: CircularProgressIndicator(
      color: mainSilverColor,
    ),
  );

  StepState _setStepState(int step) {
    return currentStep > step ? StepState.complete : StepState.disabled;
  }

  void _onStepContinue() async {
    if (currentStep == 0) {
      // 핸드폰 번호 입력하는 화면
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
      // 핸드폰 인증하는 화면 -> 인증 성공하면 파이어베이스 유저 핸드폰 번호 정보 삭제
      isNextLoading = true;
      setState(() {});
      final errorCode = await signInWithSmsCode(verificationCode!);
      if (errorCode == null) {
        await deletePhoneUser();
        currentStep += 1;
        setState(() {});
      } else {
        if (mounted) showSnackBar(context, errorCode);
      }
      isNextLoading = false;
      setState(() {});
    } else if (currentStep == 2) {
      // 이메일 입력하는 화면 -> 이메일 입력 성공 후 이메일 인증 메일 보냄
      if (emailKey.currentState!.validate()) {
        isNextLoading = true;
        setState(() {});
        String? errorCode = await createEmailAndPassword(email!, dummyPassword);
        if (mounted) {
          if (errorCode == null) {
            currentStep += 1;
            await sendEmailVerification();
          } else {
            showSnackBar(context, errorCode);
          }
          isNextLoading = false;
          setState(() {});
        }
      }
    } else if (currentStep == 3) {
      // 이메일 인증 화면 -> 이메일 인증 성공 후 파이어베이스 유저 이메일 정보 삭제
      isNextLoading = true;
      setState(() {});
      final emailVerification =
          await isEmailVerification(email!, dummyPassword);
      if (emailVerification) {
        await deleteEmailUser(email!, dummyPassword);
        currentStep += 1;
        myInfoEntity.email = email!;
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
      // 폰 인증화면으로 가지 않고 폰번호 입력 화면으로 넘어간다.
      currentStep -= 2;
      setState(() {});
    } else if (currentStep == 3) {
      // 이메일 인증 스크린에서 뒤로가기 했을 경우 -> 이메일 생성을 다시 해야하기 때문에 삭제해주어야 한다.
      isCancelLoading = true;
      setState(() {});
      final String? errorCode = await deleteEmailUser(email!, dummyPassword);
      if (errorCode == null) {
        currentStep -= 1;
      } else {
        if (mounted) showSnackBar(context, errorCode);
      }
      isCancelLoading = false;
      setState(() {});
    } else if (currentStep == 4) {
      // 이메일 변경 확인 화면 -> 뒤로가기 했을 때 이메일 인증 화면으로 가지 않고 이메일 입력 화면으로 넘어간다.
      currentStep -= 2;
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
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        email = val;
                        return validateEmail(val!);
                      },
                    ),
                  ],
                ),
              ),
              isActive: currentStep > 2,
              state: _setStepState(2),
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
              isActive: currentStep > 3,
              state: _setStepState(3),
            ),
            Step(
              title: Container(),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "기존 이메일",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    myInfoEntity.email,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "변경 이메일",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    email ?? "알 수 없음",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showCustomDialog(
                        context,
                        const Text("이메일을 변경하시겠습니까?"),
                        extraButton: ElevatedButton(
                          onPressed: _anyButtonLoading()
                              ? null
                              : () async {
                                  isNextLoading = true;
                                  setState(() {});
                                  // Todo: 이메일 변경 백엔드로 알림
                                  if (context.mounted) {
                                    showSnackBar(context, '이메일을 변경하였습니다.');
                                    // 확실하게 다이얼로그를 닫는 코드. ChatGPT가 알려줌
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    context.pop();
                                  }
                                  isNextLoading = false;
                                  setState(() {});
                                },
                          child: const Text(
                            "변경",
                            style: TextStyle(
                              color: mainSilverColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "이메일 변경하기",
                      style: TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              isActive: currentStep > 4,
              state: _setStepState(4),
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
                  if (currentStep < 4)
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
