// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
  id: (json['id'] as num).toInt(),
  nickname: json['nickname'] as String,
  stateMsg: json['stateMsg'] as String?,
  profileUrl: json['profileUrl'] as String?,
  mannerTemperature: (json['mannerTemperature'] as num).toDouble(),
);

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'nickname': instance.nickname,
  'stateMsg': instance.stateMsg,
  'profileUrl': instance.profileUrl,
  'mannerTemperature': instance.mannerTemperature,
};

UserDTO _$UserDTOFromEntity(UserEntity entity) => UserDTO(
  id: entity.id,
  nickname: entity.nickname,
  stateMsg: entity.stateMsg,
  profileUrl: entity.profileUrl,
  mannerTemperature: entity.mannerTemperature,
);

UserEntity _$UserDTOToEntity(UserDTO instance) => UserEntity(
  id: instance.id,
  nickname: instance.nickname,
  stateMsg: instance.stateMsg,
  profileUrl: instance.profileUrl,
  mannerTemperature: instance.mannerTemperature,
);
