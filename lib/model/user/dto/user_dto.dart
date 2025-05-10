import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/user/entity/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
final class UserDTO {
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

  UserDTO({
    required this.id,
    required this.nickname,
    this.stateMsg,
    this.profileUrl,
    required this.mannerTemperature,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  factory UserDTO.fromEntity(UserEntity entity) => _$UserDTOFromEntity(entity);

  UserEntity toEntity() => _$UserDTOToEntity(this);
}
