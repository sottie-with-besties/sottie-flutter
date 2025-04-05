import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class TokenStorage {
  final _tokenStorage = const FlutterSecureStorage();

  final _refreshTokenKey = 'refresh_token_key';
  final _accessTokenKey = 'access_token_key';

  String _accessToken = '';

  String get accessToken => _accessToken;

  void changeAccessToken({required String newAcessToken}) {
    _accessToken = newAcessToken;
  }

  Future<String?> getAccessToken() async {
    return await _tokenStorage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _tokenStorage.read(key: _refreshTokenKey);
  }

  Future<void> writeAccessToken({required String newAccessToken}) async {
    await _tokenStorage.write(key: _accessTokenKey, value: newAccessToken);
  }

  Future<void> writeRefreshToken({required String newRefreshToken}) async {
    await _tokenStorage.write(key: _refreshTokenKey, value: newRefreshToken);
  }
}
