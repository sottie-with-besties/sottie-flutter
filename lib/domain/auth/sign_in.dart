import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/core/local_database/secure_storage.dart';
import 'package:sottie_flutter/data/auth/model/oauth_login_model.dart';
import 'package:sottie_flutter/domain/auth/auth_type.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/repository/auth/auth_retrofit.dart';

part 'apple_login.dart';
part 'email_login.dart';
part 'google_login.dart';
part 'kakao_login.dart';

Future<String?> signIn(
    {required AuthType authType, String? email, String? password}) async {
  String? errorCode;

  switch (authType) {
    case AuthType.email:
      // Todo: 예외 처리 미흡
      errorCode = null;
      await _emailLogin(email: email!, password: password!);
      break;
    case AuthType.kakao:
      errorCode = await _signInWithKakao();
      errorCode = await _checkUserAtServer();
      break;
    case AuthType.google:
      errorCode = await _signInWithGoogle();
      errorCode = await _checkUserAtServer();
      break;
    case AuthType.apple:
      errorCode = await _signInWithApple();
      errorCode = await _checkUserAtServer();
      break;
    default:
      errorCode = 'switch default error catch';
      break;
  }

  return errorCode;
}

OauthLoginModel _oauthLoginModel = OauthLoginModel();

Future<String?> _checkUserAtServer() async {
  // Todo: 백엔드로 id 토큰과 accessToken 보낸 후 회원가입 여부 확인

  return null;
}
