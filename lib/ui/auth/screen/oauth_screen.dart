import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/domain/provider/auth/kakao_login.dart';
import 'package:sottie_flutter/ui/auth/widget/oauth_button.dart';

class OAuthScreen extends StatelessWidget {
  const OAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text(
                "Sottie",
                style: TextStyle(
                  fontSize: 80.sp,
                ),
              )),
              SizedBox(height: 82.sp),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Text(
                  "로그인을 진행해주세요",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              OAuthButton(
                  imgPath: AssetPath.googleLogin,
                  onPressed: () async {
                    log("google login button");
                  }),
              OAuthButton(
                  imgPath: AssetPath.appleLogin,
                  onPressed: () {
                    signOutKakao();
                  }),
              OAuthButton(
                  imgPath: AssetPath.kakaoLogin,
                  onPressed: () async {
                    log("kakao login button");
                    await signInWithKakao();
                  }),
            ],
          ),
        ));
  }
}
