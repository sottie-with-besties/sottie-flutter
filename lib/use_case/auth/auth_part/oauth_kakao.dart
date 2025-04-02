part of '../auth_use_case.dart';

Future<String?> _signInWithKakao() async {
  /// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      /// ID 토큰, 액세스 토큰이 담겨있습니다.
      final token = await UserApi.instance.loginWithKakaoTalk();

      /// 나에 대한 정보입니다.
      // final user = await UserApi.instance.me();

      authType = AuthType.kakao;

      _oauthLoginEntity.idToken = token.idToken;
      _oauthLoginEntity.accessToken = token.accessToken;

      /// Todo: 카카오 이메일 파라미터 받으면 signUpEntity에 넣기

      return null;
    } catch (error) {
      log('카카오톡으로 로그인 실패 $error');

      /// 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      /// 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return "카카오 로그인 실패: ${error.code}";
      }

      /// 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        final token = await UserApi.instance.loginWithKakaoAccount();

        // final user = await UserApi.instance.me();

        authType = AuthType.kakao;

        _oauthLoginEntity.idToken = token.idToken;
        _oauthLoginEntity.accessToken = token.accessToken;

        return null;
      } catch (error) {
        log('카카오계정으로 로그인 실패 $error');
        return '카카오계정으로 로그인 실패';
      }
    }
  } else {
    /// 앱에 카카오톡이 설치 안되어있을 때
    try {
      final token = await UserApi.instance.loginWithKakaoAccount();

      // final user = await UserApi.instance.me();

      authType = AuthType.kakao;

      _oauthLoginEntity.idToken = token.idToken;
      _oauthLoginEntity.accessToken = token.accessToken;

      return null;
    } catch (error) {
      log('카카오계정으로 로그인 실패 $error');
      return '카카오계정으로 로그인 실패';
    }
  }
}

Future<String?> _signOutKakao() async {
  try {
    /// logout()은 말그대로 로그아웃만 하고 연결을 완전히 끊지는 않는다.
    /// unlink()는 완전히 로그아웃을 끊어서 다시 로그인 해야할 때 계정이랑 비밀번호 다시 쳐야됨

    // await UserApi.instance.logout();
    await UserApi.instance.unlink();
    log('카카오 로그아웃 성공, SDK에서 토큰 삭제');

    authType = null;
    return null;
  } catch (_) {
    log('로그아웃 실패, SDK에서 토큰 삭제(?)');
    return "카카오 로그아웃 실패";
  }
}
