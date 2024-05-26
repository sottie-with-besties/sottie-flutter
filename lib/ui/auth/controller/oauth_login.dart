import 'package:sottie_flutter/domain/provider/auth/oauth_login.dart';

Future<void> googleLogin() async {
  await signInWithGoogle();
}
