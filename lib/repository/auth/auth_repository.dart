import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/auth/model/email_sign_up_model.dart';
import 'package:sottie_flutter/data/auth/model/token_model.dart';

part 'auth_repository.g.dart';

/// Authentication 관련 Rest Api 통신 코드
@RestApi(baseUrl: serverIp)
abstract class AuthTokenRepository {
  factory AuthTokenRepository(Dio dio, {String baseUrl}) = _AuthTokenRepository;

  @POST('/sottie/users/signup')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse> signUp({
    @Body() required EmailSignUpModel signUpModel,
  });

  @POST('/auth/emailLogin')
  Future<TokenModel> emailLogin({
    @Header('authorization') required String emailAndPassword,
  });

  @POST('/auth/token')
  Future<AccessTokenModel> refreshAccessToken({
    @Header('authorization') required String refreshToken,
  });
}
