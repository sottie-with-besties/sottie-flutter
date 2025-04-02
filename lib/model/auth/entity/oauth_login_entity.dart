final class OauthLoginEntity {
  String? idToken;
  String? accessToken;

  OauthLoginEntity({this.idToken = '', this.accessToken = ''});

  Map<String, dynamic> toJson() {
    return {'idToken': idToken, 'accessToken': accessToken};
  }
}
