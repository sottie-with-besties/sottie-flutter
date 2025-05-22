import 'package:objectbox/objectbox.dart';
import 'package:sottie_flutter/model/user/user_model.dart';

@Entity()
final class UserLocalModel {
  @Id()
  int id = 0;

  /// 유저 ID
  final int userId;

  /// 유저 닉네임
  final String nickname;

  /// 유저 상태 메세지
  final String? stateMsg;

  /// 유저 프로필 URL
  final String? profileUrl;

  /// 매너온도
  final double mannerTemperature;

  UserLocalModel({
    required this.userId,
    required this.nickname,
    this.stateMsg,
    this.profileUrl,
    required this.mannerTemperature,
  });

  factory UserLocalModel.fromModel(UserModel model) {
    return UserLocalModel(
      userId: model.id,
      nickname: model.nickname,
      stateMsg: model.stateMsg,
      profileUrl: model.profileUrl,
      mannerTemperature: model.mannerTemperature,
    );
  }

  UserModel toModel() {
    return UserModel(
      id: userId,
      nickname: nickname,
      stateMsg: stateMsg,
      profileUrl: profileUrl,
      mannerTemperature: mannerTemperature,
    );
  }
}
