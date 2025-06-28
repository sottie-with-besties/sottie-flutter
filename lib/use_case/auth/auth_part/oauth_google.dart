part of '../auth_use_case.dart';

sealed class _GoogleAuth {
  static final _googleSignIn = GoogleSignIn.instance;

  /// 구글 로그인
  static Future<List<dynamic>> signInWithGoogle() async {
    try {
      /// 초기화 및 Id토큰 가져오기
      await _googleSignIn.initialize(serverClientId: NativeKey.webClientId);

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final String? idToken = googleUser.authentication.idToken;

      /// 액세스 토큰 가져오기
      const scopes = <String>[
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      /// 먼저 기존 권한 있는지 확인
      final authResult = await _googleSignIn.authorizationClient
          .authorizationForScopes(scopes);

      String? accessToken;

      if (authResult != null) {
        accessToken = authResult.accessToken;
      } else {
        // 없다면 사용자에게 권한 요청 UI를 띄움
        final newAuthResult = await _googleSignIn.authorizationClient
            .authorizeScopes(scopes);
        accessToken = newAuthResult.accessToken;
      }

      log(idToken.toString(), name: 'Id Token');
      log(accessToken.toString(), name: 'Access Token');

      if (idToken == null) {
        return [false, "토큰이 존재하지 않습니다", ''];
      } else {
        return [true, idToken, accessToken];
      }
    } on Exception catch (_) {
      return [false, "구글 로그인 도중 에러가 발생했습니다", ''];
    }
  }

  static Future<bool> signOutGoogle() async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      log('sign out google');

      return true;
    } on Exception catch (_) {
      log('sign out google failed');
      return false;
    }
  }
}
