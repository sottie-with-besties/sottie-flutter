final class UserModel {
  /// 유저 ID
  final int id;

  /// 유저 닉네임
  final String nickname;

  /// 유저 상태 메세지
  final String? stateMsg;

  /// 유저 프로필 URL
  final String? profileUrl;

  /// 매너온도
  final double mannerTemperature;

  UserModel({
    required this.id,
    required this.nickname,
    required this.stateMsg,
    required this.profileUrl,
    required this.mannerTemperature,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nickname: json['nickname'],
      stateMsg: json['stateMsg'],
      profileUrl: json['profileUrl'],
      mannerTemperature: json['mannerTemperature'],
    );
  }
}
