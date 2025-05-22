import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/model/auth/auth_type.dart';
import 'package:sottie_flutter/repository/auth/interface/auth_repository.dart';

import '../../core/local_database/token_storage.dart';

part 'auth_part/auth_email.dart';
part 'auth_part/oauth_apple.dart';
part 'auth_part/oauth_google.dart';
part 'auth_part/oauth_kakao.dart';

sealed class AuthUseCase {
  static final _tokenStorage = TokenStorage();

  static Future<bool> signIn({
    required AuthType authType,
    String? email,
    String? password,
  }) async {
    List<dynamic> result = [];

    switch (authType) {
      case AuthType.email:
        final loginSuccess = await _EmailAuth.emailLogin(
          email: email!,
          password: password!,
        );

        return loginSuccess;
      case AuthType.kakao:
        result = await _KakaoAuth.signInWithKakao();
        break;
      case AuthType.google:
        result = await _GoogleAuth.signInWithGoogle();
        break;
      case AuthType.apple:
        result = await _AppleAuth.signInWithApple();
        break;
      default:
        return false;
    }

    /// 아래 로직은 OAuth만 해당
    final [bool isSuccess, String idToken, String accessToken] = result;

    if (isSuccess) {
      final oauthSuccess = await _oauthLogin(
        oauthType: authType,
        idToken: idToken,
        accessToken: accessToken,
      );

      return oauthSuccess;
    } else {
      return false;
    }
  }

  /// OAuth로 로그인하기 (카카오, 구글, 애플)
  static Future<bool> _oauthLogin({
    required AuthType oauthType,
    required String idToken,
    required String accessToken,
  }) async {
    try {
      log('백엔드로 토큰 전송');

      /// 백엔드로 ID 토큰과 액세스 토큰 전송
      final tokenModel = await AuthRepository().socialLogin(
        idToken: idToken,
        accessToken: accessToken,
      );

      /// 시큐어 스토리지에 토큰 저장
      await _tokenStorage.writeRefreshToken(
        newRefreshToken: tokenModel.refreshToken,
      );
      await _tokenStorage.writeAccessToken(
        newAccessToken: tokenModel.accessToken,
      );

      /// 액세스 토큰 체인지
      _tokenStorage.changeAccessToken(newAcessToken: tokenModel.accessToken);

      return true;
    } catch (_) {
      return false;
    }
  }

  /// 로그아웃
  static Future<bool> signOut({required AuthType authType}) async {
    bool signOutSuccess;

    switch (authType) {
      case AuthType.email:
        signOutSuccess = await _EmailAuth.signOutEmail();
        break;
      case AuthType.kakao:
        signOutSuccess = await _KakaoAuth.signOutKakao();
        break;
      case AuthType.google:
        signOutSuccess = await _GoogleAuth.signOutGoogle();
        break;
      case AuthType.apple:
        signOutSuccess = await _AppleAuth.signOutApple();
        break;
      default:
        return false;
    }

    return signOutSuccess;
  }
}
