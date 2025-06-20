import 'package:auth_button_kit/auth_button_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/auth/auth_type.dart';
import 'package:sottie_flutter/ui/auth/widget/oauth_button.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/app_logo.dart';
import 'package:sottie_flutter/use_case/auth/auth_use_case.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteSilverColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 12 * ScreenSize.wu,
          right: 12 * ScreenSize.wu,
          bottom: 32 * ScreenSize.hu,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    const AppLogo(),
                    const SizedBox(width: 10),
                    Text(
                      'Sottie',
                      style: GoogleFonts.jua(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  /// 카카오 로그인
                  OAuthButton(
                    imgPath: AssetPath.kakaoLogin,
                    onPressed: () async {
                      final loginSuccess = await AuthUseCase.signIn(
                        authType: AuthType.kakao,
                      );

                      if (context.mounted) {
                        loginSuccess
                            ? context.go(CustomRouter.homePath)
                            : ModalController.showCustomSnackBar(
                              context,
                              "로그인에 실패하였습니다",
                            );
                      }
                    },
                  ),

                  /// 구글 로그인
                  AuthButton(
                    onPressed: (_) async {
                      final loginSuccess = await AuthUseCase.signIn(
                        authType: AuthType.google,
                      );

                      if (context.mounted) {
                        loginSuccess
                            ? context.go(CustomRouter.homePath)
                            : ModalController.showCustomSnackBar(
                              context,
                              "로그인에 실패하였습니다",
                            );
                      }
                    },
                    brand: Method.google,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    fontWeight: FontWeight.bold,
                  ),

                  /// 애플 로그인
                  AuthButton(
                    onPressed: (_) async {
                      context.go(CustomRouter.homePath);

                      /// 애플 로그인 코드
                      // final loginSuccess =  await AuthUseCase.signIn(authType: AuthType.apple);

                      // if (context.mounted) {
                      //   loginSuccess
                      //       ? context.go(CustomRouter.homePath)
                      //       : ModalController.showCustomSnackBar(
                      //     context,
                      //     "로그인에 실패하였습니다",
                      //   );
                      // }
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
            ],
          ),
        ),
      ),
    );
  }
}
