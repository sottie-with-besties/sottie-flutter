import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

Future<GoogleSignInAuthentication?> signInWithGoogle() async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    log("No Error");
    return googleAuth;
  } on Exception catch (_) {
    log("Error");
    return null;
  }
}

Future<bool> googleSignOut() async {
  try {
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}
