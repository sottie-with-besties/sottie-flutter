import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sottie_flutter/domain/auth/auth_entity.dart';

Future<String?> signInWithGoogle() async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // 백엔드에 전송해야 할 것
    log("No Error");
    log(googleAuth!.idToken!, name: "ID Token");
    log(googleAuth.accessToken!, name: "Access Token");
    log(googleUser!.email, name: "User Email");

    authEntity = AuthEntity.google;

    return null;
  } on Exception catch (_) {
    return "구글 로그인 도중 에러가 발생했습니다.";
  }
}
