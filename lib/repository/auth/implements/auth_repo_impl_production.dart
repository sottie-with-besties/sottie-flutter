import 'package:sottie_flutter/model/auth/token_model.dart';
import 'package:sottie_flutter/repository/auth/interface/auth_repository.dart';

final class AuthRepoImplProduction implements AuthRepository {
  @override
  Future<String> refreshAccessToken({required String refreshToken}) {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }

  @override
  Future<TokenModel> socialLogin({
    required String idToken,
    required String accessToken,
  }) {
    // TODO: implement socialLogin
    throw UnimplementedError();
  }
}
