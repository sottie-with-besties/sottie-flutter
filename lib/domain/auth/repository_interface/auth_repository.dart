import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/data/auth/model/email_sign_up_model.dart';
import 'package:sottie_flutter/data/auth/model/token_model.dart';

abstract interface class AuthRepository {
  /// 회원가입
  Future<HttpResponse> signUp({
    required EmailSignUpModel signUpModel,
  });

  /// 이메일 로그인
  Future<TokenModel> emailLogin({
    required String emailAndPassword,
  });

  /// 액세스 토큰 재발급
  Future<AccessTokenModel> refreshAccessToken({
    required String refreshToken,
  });
}
