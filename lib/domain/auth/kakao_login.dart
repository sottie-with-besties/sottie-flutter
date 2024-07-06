import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> signInWithKakao() async {
  // 카카오 로그인 구현 예제
  // 카카오톡 실행 가능 여부 확인
  // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      // ID 토큰, 액세스 토큰이 담겨있습니다.
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      log('카카오톡으로 로그인 성공');

      // 나에 대한 정보입니다.
      User user = await UserApi.instance.me();
    } catch (error) {
      log('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        // Todo: 로그인 취소로 처리 (예: 뒤로 가기, 다이얼로그 띄우기 등)
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        log('카카오계정으로 로그인 성공');
      } catch (error) {
        // Todo: 에러 처리 (예: 뒤로 가기)
        log('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    // 앱에 카카오톡이 설치 안되어있을 때
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      log('카카오계정으로 로그인 성공');
      log(token.toString());
      User user = await UserApi.instance.me();
    } catch (error) {
      // Todo: 에러 처리
      log('카카오계정으로 로그인 실패 $error');
    }
  }
}

Future<void> signOutKakao() async {
  try {
    // logout()은 말그대로 로그아웃만 하고 연결을 완전히 끊지는 않는다.
    // unlink()는 완전히 로그아웃을 끊어서 다시 로그인 해야할 때 계정이랑 비밀번호 다시 쳐야됨

    // await UserApi.instance.logout();
    await UserApi.instance.unlink();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    // Todo: 로그아웃 실패했을 때 에러처리 (다이얼로그로?)
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}
