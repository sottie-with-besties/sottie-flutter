import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/core/local_database/secure_storage.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/auth/model/oauth_login_model.dart';
import 'package:sottie_flutter/data/auth/model/token_model.dart';
import 'package:sottie_flutter/provider/auth/auth_token.dart';
import 'package:sottie_flutter/provider/auth/auth_type.dart';
import 'package:sottie_flutter/provider/auth/sign_up_entity.dart';
import 'package:sottie_flutter/provider/user/my_info_entity.dart';
import 'package:sottie_flutter/repository/auth/auth_repository.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';

part 'apple_login.dart';
part 'email_login.dart';
part 'google_login.dart';
part 'kakao_login.dart';

Future<String?> signIn(
    {required AuthType authType, String? email, String? password}) async {
  String? errorCode;

  switch (authType) {
    case AuthType.email:
      try {
        await _emailLogin(email: email!, password: password!);
        errorCode = null;
      } catch (_) {
        errorCode = "이메일 로그인 에러가 발생하였습니다";
      }
      break;
    case AuthType.kakao:
      errorCode = await _signInWithKakao();
      break;
    case AuthType.google:
      errorCode = await _signInWithGoogle();
      break;
    case AuthType.apple:
      errorCode = await _signInWithApple();
      break;
    default:
      errorCode = 'switch default error catch';
      break;
  }

  return errorCode;
}

OauthLoginModel _oauthLoginEntity = OauthLoginModel();

/// OAuth로 로그인하기 (카카오, 구글, 애플)
Future<void> oauthLogin({
  required BuildContext context,
  required AuthType oauthType,
}) async {
  try {
    final errorCode = await signIn(authType: oauthType);

    if (context.mounted) {
      if (errorCode == null) {
        // Todo: 백엔드로 ID 토큰과 액세스 토큰 전송
        log(_oauthLoginEntity.toJson().toString(), name: '백엔드로 토큰 전송');

        late TokenModel oAuthToken;

        // 이걸로 받았다고 가정
        final receivedTokens = TokenModel(
          refreshToken: 'refreshToken',
          accessToken: 'accessToken',
        );

        /// 유저가 OAuth로 로그인 시도하였으나 회원가입이 안되어 있음
        if (receivedTokens.refreshToken == '') {
          oauthSignUpEntity.idToken = _oauthLoginEntity.idToken;
          oauthSignUpEntity.accessToken = _oauthLoginEntity.accessToken;

          context.push(
            '${CustomRouter.authPath}/${CustomRouter.certificationPath}',
            extra: {
              'isOauthSignUp': true,
            },
          );
          // Todo: 백엔드로 OAuthSignUpEntity 보내기
          log(oauthSignUpEntity.toJson().toString());

          // OAuthSignUpEntity 보내고 받은 토큰
          final receivedToken2 = TokenModel(
              refreshToken: 'refreshToken', accessToken: 'accessToken');
          oAuthToken = receivedToken2;
        } else {
          oAuthToken = receivedTokens;
        }

        /// 시큐어 스토리지에 토큰 저장
        await tokenStorage.write(
            key: refreshTokenKey, value: oAuthToken.refreshToken);
        await tokenStorage.write(
            key: accessTokenKey, value: oAuthToken.accessToken);
        accessToken = oAuthToken.accessToken;

        /// 회원가입 또는 로그인 완료 후 홈으로 넘어가기
        if (context.mounted) {
          context.go(CustomRouter.homePath);
        }
      } else {
        /// 알 수 없는 에러
        showSnackBar(context, errorCode);
      }
    }
  } on Exception catch (_) {
    if (context.mounted) {
      showSnackBar(context, "알 수 없는 에러가 발생하였습니다");
    }
  }
}
