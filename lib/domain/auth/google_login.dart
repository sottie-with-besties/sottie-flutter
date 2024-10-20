part of 'sign_in.dart';

Future<String?> _signInWithGoogle() async {
  /// Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    /// Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    _oauthLoginModel.idToken = googleAuth!.idToken!;
    _oauthLoginModel.accessToken = googleAuth.accessToken!;

    authType = AuthType.google;
    myInfoEntity.email = googleUser!.email;

    return null;
  } on Exception catch (_) {
    return "구글 로그인 도중 에러가 발생했습니다.";
  }
}
