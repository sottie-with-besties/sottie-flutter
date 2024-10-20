part of 'sign_in.dart';

Future<String?> _signInWithGoogle() async {
  /// Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(serverClientId: webClientId).signIn();

    /// Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth == null) {
      return "구글 로그인 취소";
    }

    _oauthLoginEntity.idToken = googleAuth.idToken ?? '';
    _oauthLoginEntity.accessToken = googleAuth.accessToken ?? '';

    authType = AuthType.google;
    myInfoEntity.email = googleUser!.email;

    return null;
  } on Exception catch (_) {
    return "구글 로그인 도중 에러가 발생했습니다";
  }
}
