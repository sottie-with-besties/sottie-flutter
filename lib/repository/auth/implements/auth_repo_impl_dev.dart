import 'dart:convert';

import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/auth/token_model.dart';
import 'package:sottie_flutter/repository/auth/interface/auth_repository.dart';

final class AuthRepoImplDev implements AuthRepository {
  @override
  Future<TokenModel> emailLogin({
    required String email,
    required String password,
  }) async {
    final base64String = utf8.fuse(base64).encode('$email:$password');

    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/auth/login",
    );

    final headers = {'authorization': 'Basic $base64String'};

    final response = await ApiEnv().cleanClient.post(uri, headers: headers);

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return TokenModel.fromJson(json);
  }

  @override
  Future<TokenModel> socialLogin({
    required String idToken,
    required String accessToken,
  }) async {
    final base64String = utf8.fuse(base64).encode('$idToken:$accessToken');

    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/auth/oauth",
    );

    final headers = {'authorization': 'Basic $base64String'};

    final response = await ApiEnv().cleanClient.post(uri, headers: headers);

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return TokenModel.fromJson(json);
  }

  @override
  Future<String> refreshAccessToken({required String refreshToken}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/auth/accessToken",
    );

    final headers = {'refreshToken': refreshToken};

    final response = await ApiEnv().cleanClient.post(uri, headers: headers);

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    final accessToken = json['accessToken'] as String;

    return accessToken;
  }
}
