part of '../auth_use_case.dart';

sealed class _EmailAuth {
  /// 이메일로 로그인 => base64로 변환
  static Future<bool> emailLogin({
    required String email,
    required String password,
  }) async {
    try {
      final tokenStorage = TokenStorage();

      /// 서버로 이메일 비번 전송하기
      final tokenModel = await AuthRepository().emailLogin(
        email: email,
        password: password,
      );

      // 토큰들 저장
      await Future.wait([
        tokenStorage.writeRefreshToken(
          newRefreshToken: tokenModel.refreshToken,
        ),
        tokenStorage.writeAccessToken(newAccessToken: tokenModel.accessToken),
      ]);

      tokenStorage.changeAccessToken(newAcessToken: tokenModel.accessToken);

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> signOutEmail() async {
    try {
      return true;
    } catch (_) {
      return false;
    }
  }
}
