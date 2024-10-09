import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/auth/model/token_model.dart';

part 'auth_retrofit.g.dart';

@RestApi(baseUrl: serverIp)
abstract class AuthTokenRetrofit {
  factory AuthTokenRetrofit(Dio dio, {String baseUrl}) = _AuthTokenRetrofit;

  @POST('/auth/emailLogin')
  Future<TokenModel> emailLogin({
    @Header('authorization') required String emailAndPassword,
  });

  @POST('/auth/token')
  Future<AccessTokenModel> refreshAccessToken({
    @Header('authorization') required String refreshToken,
  });
}