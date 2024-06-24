import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

Future<bool> signInWithGoogle() async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    log("No Error");
    log(googleAuth!.idToken!, name: "ID Token");
    log(googleAuth.accessToken!, name: "Access Token");

    return true;
  } on Exception catch (_) {
    // Todo: 에러 처리
    log("Error");
    return false;
  }
}

Future<bool> signOutGoogle() async {
  try {
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    log('sign out google');
    return true;
  } on Exception catch (_) {
    // Todo: 에러 처리
    log('sign out google failed');
    return false;
  }
}
