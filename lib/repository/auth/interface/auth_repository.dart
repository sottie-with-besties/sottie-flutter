import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/model/auth/dto/email_sign_up_dto.dart';
import 'package:sottie_flutter/model/auth/dto/token_dto.dart';

abstract interface class AuthRepository {
  /// 회원가입
  Future<HttpResponse> signUp({required EmailSignUpDTO signUpModel});

  /// 이메일 로그인
  Future<TokenDTO> emailLogin({required String emailAndPassword});

  /// 액세스 토큰 재발급
  Future<AccessTokenDTO> refreshAccessToken({required String refreshToken});
}
