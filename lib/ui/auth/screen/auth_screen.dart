import 'dart:developer';

import 'package:auth_button_kit/auth_button_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/auth/model/email_login_model.dart';
import 'package:sottie_flutter/domain/auth/auth_type.dart';
import 'package:sottie_flutter/domain/auth/sign_in.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/auth/widget/oauth_button.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/widget/app_logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    EmailLoginModel emailLoginModel = EmailLoginModel();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainWhiteSilverColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    AppLogo(),
                    SizedBox(width: 10),
                    AppBarTitle(title: "Sottie"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainWhiteSilverColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mainBlueColor),
                ),
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        child: Text(
                          "로그인",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AuthTextField(
                        hint: "이메일 입력",
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          emailLoginModel.email = val;
                          return validateEmail(val!);
                        },
                      ),
                      AuthTextField(
                        obsecure: true,
                        hint: "비밀번호 입력",
                        validator: (val) {
                          emailLoginModel.password = val;
                          return validatePassword(val!);
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  // signIn에 백엔드로 이메일 코드 전송 포함
                                  final errorCode = await signIn(
                                    authType: AuthType.email,
                                    email: emailLoginModel.email,
                                    password: emailLoginModel.password,
                                  );

                                  if (context.mounted) {
                                    errorCode == null
                                        ? context.go(CustomRouter.homePath)
                                        : showSnackBar(context, errorCode);
                                  }
                                }
                              },
                              child: const Text(
                                "로그인",
                                style: TextStyle(
                                  color: mainWhiteSilverColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _authUtilButton('회원가입', () async {
                              await context
                                  .push('/auth/${CustomRouter.signUpPath}');
                            }),
                            Row(
                              children: [
                                _authUtilButton('ID 찾기', () async {
                                  await context
                                      .push('/auth/${CustomRouter.findIdPath}');
                                }),
                                const SizedBox(width: 10),
                                _authUtilButton('비밀번호 찾기/변경', () async {
                                  await context.push(
                                      '/auth/${CustomRouter.findPasswordPath}');
                                }),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20 * hu),
              OAuthButton(
                  imgPath: AssetPath.kakaoLogin,
                  onPressed: () async {
                    log("kakao login button");
                    final errorCode = await signIn(authType: AuthType.kakao);

                    if (context.mounted) {
                      errorCode == null
                          ? context.go(CustomRouter.homePath)
                          : showSnackBar(context, errorCode);
                    }
                  }),
              AuthButton(
                onPressed: (_) async {
                  final errorCode = await signIn(authType: AuthType.google);

                  if (context.mounted) {
                    errorCode == null
                        ? context.go(CustomRouter.homePath)
                        : showSnackBar(context, errorCode);
                  }
                },
                brand: Method.google,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                fontWeight: FontWeight.bold,
              ),
              AuthButton(
                onPressed: (_) async {
                  // log("Continue with Apple");
                  // final errorCode = await signOut();
                  // log(errorCode.toString());
                  context.go(CustomRouter.homePath);

                  /// 아래 레트로핏 코드 정상 작동
                  // await AuthTokenRetrofit(dioWithNoInterceptor).signUp(signUpModel: SignUpModel(
                  //     name: null,
                  //     phoneNumber: "01094908151",
                  //     gender: 'MALE',
                  //     identifier: null,
                  //     birthYear: null,
                  //     phoneAuthenticated: true,
                  //     email: "arisongha1022@gmail.com",
                  //     password: "asap0302!!"
                  // ));
                },
                brand: Method.apple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _authUtilButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
    ),
  );
}
