final class AccessTokenEntity {
  String _accessToken = '';

  String get accessToken => _accessToken;

  void changeToken(String newToken) => _accessToken = newToken;
}

final accessTokenEntity = AccessTokenEntity();
