import 'package:sottie_flutter/model/user/dto/user_dto.dart';

final class UserEntity {
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

  UserEntity({
    required this.id,
    required this.nickname,
    required this.stateMsg,
    required this.profileUrl,
    required this.mannerTemperature,
  });

  factory UserEntity.fromDTO({required UserDTO model}) {
    return UserEntity(
      id: model.id,
      nickname: model.nickname,
      stateMsg: model.stateMsg,
      profileUrl: model.profileUrl,
      mannerTemperature: model.mannerTemperature,
    );
  }
}
