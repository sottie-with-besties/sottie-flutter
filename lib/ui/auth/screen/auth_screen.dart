import 'dart:developer';

import 'package:auth_button_kit/auth_button_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/auth/google_login.dart';
import 'package:sottie_flutter/domain/auth/kakao_login.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
import 'package:sottie_flutter/ui/auth/widget/oauth_button.dart';
import 'package:sottie_flutter/ui/common/widget/app_logo.dart';

class OAuthScreen extends StatelessWidget {
  const OAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String? email;
    String? password;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColoredBox(
        color: lightBrownColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const AppLogo(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Sottie",
                          style: GoogleFonts.jua(
                            fontSize: 46,
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
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
                            "로그인을 진행해주세요!",
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
                            email = val;
                            return validateEmail(val!);
                          },
                        ),
                        AuthTextField(
                          obsecure: true,
                          hint: "비밀번호 입력",
                          validator: (val) {
                            password = val;
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
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    /*
                                    Todo: 로그인 성공했을 때 => 해당 이메일과 패스워드를 서버에 전송 후
                                    정보가 유효하면 메인페이지로 라우팅
                                    이메일이 존재하지 않거나 비밀번호가 다르면 스낵바, 다이얼로그 등 에러 표시
                                     */
                                  }
                                },
                                child: const Text(
                                  "로그인",
                                  style: TextStyle(
                                    color: mainSilverColor,
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
                                    await context.push(
                                        '/auth/${CustomRouter.findIdPath}');
                                  }),
                                  const SizedBox(width: 10),
                                  _authUtilButton('비밀번호 찾기', () async {
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
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "------------------------",
                        style: _dividerStyle,
                      ),
                      Text(
                        "또는",
                        style: _dividerStyle,
                      ),
                      Text(
                        "-------------------------",
                        style: _dividerStyle,
                      ),
                    ],
                  ),
                ),
                OAuthButton(
                    imgPath: AssetPath.kakaoLogin,
                    onPressed: () async {
                      log("kakao login button");
                      final errorCode = await signInWithKakao();
                      // Todo: OAuth는 백엔드에 먼저 ID 토큰과 같은 정보를 보낸 후 본인인증이 안되어 있으면
                      // Todo: 본인 인증 페이지로 넘어가게 하는 작업
                    }),
                AuthButton(
                  onPressed: (_) async {
                    final errorCode = await signInWithGoogle();
                    // Todo: OAuth는 백엔드에 먼저 ID 토큰과 같은 정보를 보낸 후 본인인증이 안되어 있으면
                    // Todo: 본인 인증 페이지로 넘어가게 하는 작업
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
      ),
    );
  }
}

const _dividerStyle = TextStyle(
  color: mainSilverColor,
  fontWeight: FontWeight.bold,
);

Widget _authUtilButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
    ),
  );
}
