import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/rest_api/repository_env.dart';
import 'package:sottie_flutter/model/auth/dto/email_sign_up_dto.dart';
import 'package:sottie_flutter/model/auth/dto/token_dto.dart';
import 'package:sottie_flutter/repository/auth/interface/auth_repository.dart';

part 'auth_dev_repository_impl.g.dart';

/// Authentication 관련 Rest Api 통신 코드
@RestApi(baseUrl: devServerIp)
abstract class AuthTokenDevRepositoryImpl implements AuthRepository {
  factory AuthTokenDevRepositoryImpl(Dio dio, {String baseUrl}) =
      _AuthTokenDevRepositoryImpl;

  @override
  @POST('/sottie/users/signup')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<HttpResponse> signUp({@Body() required EmailSignUpDTO signUpModel});

  @override
  @POST('/auth/emailLogin')
  Future<TokenDTO> emailLogin({
    @Header('authorization') required String emailAndPassword,
  });

  @override
  @POST('/auth/token')
  Future<AccessTokenDTO> refreshAccessToken({
    @Header('authorization') required String refreshToken,
  });
}
