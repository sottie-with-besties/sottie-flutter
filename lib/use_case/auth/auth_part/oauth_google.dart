part of '../auth_use_case.dart';

sealed class _GoogleAuth {
  static Future<List<dynamic>> signInWithGoogle() async {
    /// Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(serverClientId: NativeKey.webClientId).signIn();

      /// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        return [false, "구글 로그인 취소", ''];
      }

      final String? idToken = googleAuth.idToken;
      final String? accessToken = googleAuth.accessToken;

      return [true, idToken, accessToken];
    } on Exception catch (_) {
      return [false, "구글 로그인 도중 에러가 발생했습니다", ''];
    }
  }

  static Future<bool> signOutGoogle() async {
    try {
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      log('sign out google');

      return true;
    } on Exception catch (_) {
      log('sign out google failed');
      return false;
    }
  }
}
