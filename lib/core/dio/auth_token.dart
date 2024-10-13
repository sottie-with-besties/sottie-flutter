import 'dart:convert';

import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/core/local_database/secure_storage.dart';
import 'package:sottie_flutter/repository/auth/auth_retrofit.dart';

/// 액세스 토큰 전역변수로 선언하기
String? accessToken;

/// 이메일로 로그인 => base64로 변환
Future<void> emailLogin({required String idAndPassword}) async {
  final base64String = utf8.fuse(base64).encode(idAndPassword);

  final tokenModel = await AuthTokenRetrofit(cleanDio)
      .emailLogin(emailAndPassword: 'Basic $base64String');

  // 토큰들 저장
  await Future.wait([
    tokenStorage.write(key: refreshTokenKey, value: tokenModel.refreshToken),
    tokenStorage.write(key: accessTokenKey, value: tokenModel.accessToken),
  ]);
}

/// 액세스 토큰 만료되었을 때 호출
Future<void> refreshAccessToken({required String refreshToken}) async {
  final newAccessTokenModel = await AuthTokenRetrofit(customDio)
      .refreshAccessToken(refreshToken: 'Bearer $refreshToken');

  accessToken = newAccessTokenModel.accessToken;

  await tokenStorage.write(key: accessTokenKey, value: newAccessTokenModel.accessToken);
}