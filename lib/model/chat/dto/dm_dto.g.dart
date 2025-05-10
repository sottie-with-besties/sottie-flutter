// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DmDTO _$DmDTOFromJson(Map<String, dynamic> json) => DmDTO(
  id: (json['id'] as num).toInt(),
  userDTO: UserDTO.fromJson(json['userDTO'] as Map<String, dynamic>),
  latestMsg: json['latestMsg'] as String,
  latestTime: DateTime.parse(json['latestTime'] as String),
  notReadMsg: (json['notReadMsg'] as num).toInt(),
);

Map<String, dynamic> _$DmDTOToJson(DmDTO instance) => <String, dynamic>{
  'id': instance.id,
  'userDTO': instance.userDTO,
  'latestMsg': instance.latestMsg,
  'latestTime': instance.latestTime.toIso8601String(),
  'notReadMsg': instance.notReadMsg,
};

DmDTO _$DmDTOFromEntity(DmEntity entity) => DmDTO(
  id: entity.id,
  userDTO: UserDTO.fromEntity(entity.userEntity),
  latestMsg: entity.latestMsg,
  latestTime: entity.latestTime,
  notReadMsg: entity.notReadMsg,
);

DmEntity _$DmDTOToEntity(DmDTO instance) => DmEntity(
  id: instance.id,
  userEntity: instance.userDTO.toEntity(),
  latestMsg: instance.latestMsg,
  latestTime: instance.latestTime,
  notReadMsg: instance.notReadMsg,
);
