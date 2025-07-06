import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/auth/token_model.dart';
import 'package:sottie_flutter/repository/auth/implements/auth_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/auth/implements/auth_repo_impl_production.dart';

abstract interface class AuthRepository {
  factory AuthRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dev => AuthRepoImplDev(),
      ServerEnvironment.production => AuthRepoImplProduction(),
      _ => throw UnimplementedError(),
    };
  }

  // 소셜 로그인
  Future<TokenModel> socialLogin({
    required String idToken,
    required String accessToken,
  });

  // 액세스 토큰 재발급
  Future<String> refreshAccessToken({required String refreshToken});
}
