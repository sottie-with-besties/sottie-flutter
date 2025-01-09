part of 'sign_in.dart';

/// 이메일로 로그인 => base64로 변환
Future<void> _emailLogin(
    {required String email, required String password}) async {
  final base64String = utf8.fuse(base64).encode('$email:$password');

  // Todo: 이메일 비번 암호화 코드

  final tokenModel = await AuthTokenRepositoryImpl(cleanDio)
      .emailLogin(emailAndPassword: 'Basic $base64String');

  // 토큰들 저장
  await Future.wait([
    tokenStorage.write(key: refreshTokenKey, value: tokenModel.refreshToken),
    tokenStorage.write(key: accessTokenKey, value: tokenModel.accessToken),
  ]);

  accessToken = tokenModel.accessToken;
}
