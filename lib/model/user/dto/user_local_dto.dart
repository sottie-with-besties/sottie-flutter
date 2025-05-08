import 'package:objectbox/objectbox.dart';
import 'package:sottie_flutter/model/common/dto_interface.dart';
import 'package:sottie_flutter/model/user/entity/user_entity.dart';

@Entity()
class UserLocalDTO implements DTO {
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

  UserLocalDTO({
    required this.userId,
    required this.nickname,
    this.stateMsg,
    this.profileUrl,
    required this.mannerTemperature,
  });

  factory UserLocalDTO.fromEntity(UserEntity entity) {
    return UserLocalDTO(
      userId: entity.id,
      nickname: entity.nickname,
      stateMsg: entity.stateMsg,
      profileUrl: entity.profileUrl,
      mannerTemperature: entity.mannerTemperature,
    );
  }

  @override
  Map<String, dynamic> fromEntity({required Object entity}) {
    throw UnimplementedError('This method is not required for local DTOs');
  }

  @override
  UserEntity toEntity() {
    return UserEntity(
      id: userId,
      nickname: nickname,
      stateMsg: stateMsg,
      profileUrl: profileUrl,
      mannerTemperature: mannerTemperature,
    );
  }
}
