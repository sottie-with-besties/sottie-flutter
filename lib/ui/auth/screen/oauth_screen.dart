import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/provider/auth/google_login.dart';
import 'package:sottie_flutter/domain/provider/auth/kakao_login.dart';
import 'package:sottie_flutter/ui/auth/widget/oauth_button.dart';

class OAuthScreen extends StatelessWidget {
  const OAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerStyle = TextStyle(
      color: mainSilverColor,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
        body: ColoredBox(
      color: const Color(0xeea0522d),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "Sottie",
              style: TextStyle(
                fontSize: 100.sp,
                color: mainSilverColor,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 85.h),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Text(
                "로그인을 진행해주세요",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: mainSilverColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OAuthButton(
                imgPath: AssetPath.kakaoLogin,
                onPressed: () async {
                  log("kakao login button");
                  await signInWithKakao();
                }),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "----------------------",
                    style: dividerStyle,
                  ),
                  Text(
                    "또는",
                    style: dividerStyle,
                  ),
                  Text(
                    "-----------------------",
                    style: dividerStyle,
                  ),
                ],
              ),
            ),
            OAuthButton(
                imgPath: AssetPath.googleLogin,
                onPressed: () async {
                  await signInWithGoogle();
                }),
            OAuthButton(
                imgPath: AssetPath.appleLogin,
                onPressed: () {
                  context.go('/home');
                }),
          ],
        ),
      ),
    ));
  }
}
