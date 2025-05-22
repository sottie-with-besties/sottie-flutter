/// 유저가 로그인 시 받는 모델
final class TokenModel {
  /// 리프레시 토큰
  final String refreshToken;

  /// 액세스 토큰
  final String accessToken;

  TokenModel({required this.refreshToken, required this.accessToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'refreshToken': refreshToken, 'accessToken': accessToken};
  }
}
