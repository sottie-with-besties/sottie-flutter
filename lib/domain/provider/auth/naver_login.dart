import 'dart:developer';

import 'package:flutter_naver_login/flutter_naver_login.dart';

Future<void> signInWithNaver() async {
  NaverLoginResult naverLogin = await FlutterNaverLogin.logIn();

  log(naverLogin.toString());
}

Future<void> logOutNaver() async {
  final logout = await FlutterNaverLogin.logOut();

  log(logout.toString());
}