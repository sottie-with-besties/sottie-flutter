import 'package:auth_button_kit/auth_button_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/asset_path.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/auth/auth_type.dart';
import 'package:sottie_flutter/ui/auth/controller/auth_validator.dart';
import 'package:sottie_flutter/ui/auth/widget/auth_text_field.dart';
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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteSilverColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteSilverColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.greyColor, width: 0.7),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          child: Text(
                            "로그인",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AuthTextField(
                          focusNode: _emailFocusNode,
                          hint: "이메일 입력",
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            _email = val;
                            return AuthValidator.validateEmail(val!);
                          },
                        ),
                        AuthTextField(
                          focusNode: _passwordFocusNode,
                          obscure: true,
                          hint: "비밀번호 입력",
                          validator: (val) {
                            _password = val;
                            return AuthValidator.validatePassword(val!);
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
                                  if (_formKey.currentState!.validate()) {
                                    // signIn에 백엔드로 이메일 코드 전송 포함
                                    final loginSuccess =
                                        await AuthUseCase.signIn(
                                          authType: AuthType.email,
                                          email: _email,
                                          password: _password,
                                        );

                                    if (context.mounted) {
                                      loginSuccess
                                          ? context.go(CustomRouter.homePath)
                                          : ModalController.showCustomSnackBar(
                                            context,
                                            "로그인에 실패하였습니다",
                                          );
                                    }
                                  }
                                },
                                child: const Text("로그인"),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _authUtilButton('회원가입', () async {
                                await context.push(
                                  '/auth/${CustomRouter.signUpPath}',
                                );
                              }),
                              Row(
                                children: [
                                  _authUtilButton('ID 찾기', () async {
                                    await context.push(
                                      '/auth/${CustomRouter.findIdPath}',
                                    );
                                  }),
                                  const SizedBox(width: 10),
                                  _authUtilButton('비밀번호 찾기/변경', () async {
                                    await context.push(
                                      '/auth/${CustomRouter.findPasswordPath}',
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20 * ScreenSize.hu),

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
          ),
        ),
      ),
    );
  }
}

Widget _authUtilButton(String text, VoidCallback onTap) {
  return GestureDetector(onTap: onTap, child: Text(text));
}
