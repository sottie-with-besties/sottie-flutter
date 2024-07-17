import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/domain/auth/auth_entity.dart';

Future<String?> signOut() async {
  String? errorCode;

  switch (authEntity) {
    case AuthEntity.email:
      errorCode = await _signOutEmail();
      break;
    case AuthEntity.kakao:
      errorCode = await _signOutKakao();
      break;
    case AuthEntity.google:
      errorCode = await _signOutGoogle();
      break;
    case AuthEntity.apple:
      errorCode = await _signOutApple();
      break;
    default:
      errorCode = null;
      break;
  }

  return errorCode;
}

Future<String?> _signOutEmail() async {
  // Todo: 백엔드로 이메일 유저 로그아웃
  authEntity = null;
  return null;
}

Future<String?> _signOutKakao() async {
  try {
    // logout()은 말그대로 로그아웃만 하고 연결을 완전히 끊지는 않는다.
    // unlink()는 완전히 로그아웃을 끊어서 다시 로그인 해야할 때 계정이랑 비밀번호 다시 쳐야됨

    // await UserApi.instance.logout();
    await UserApi.instance.unlink();
    log('카카오 로그아웃 성공, SDK에서 토큰 삭제');

    authEntity = null;
    return null;
  } catch (_) {
    log('로그아웃 실패, SDK에서 토큰 삭제(?)');
    return "카카오 로그아웃 실패";
  }
}

Future<String?> _signOutGoogle() async {
  try {
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    log('sign out google');

    authEntity = null;
    return null;
  } on Exception catch (_) {
    log('sign out google failed');
    return "구글 로그아웃 도중 에러가 발생했습니다.";
  }
}

Future<String?> _signOutApple() async {
  // Todo: 애플 로그인 로그아웃 하는 코드

  authEntity = null;
  return null;
}
