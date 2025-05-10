// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmDTO _$AlarmDTOFromJson(Map<String, dynamic> json) => AlarmDTO(
      id: json['id'] as String,
      alarmType: $enumDecode(_$AlarmTypeEnumMap, json['alarmType']),
      title: json['title'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$AlarmDTOToJson(AlarmDTO instance) => <String, dynamic>{
      'id': instance.id,
      'alarmType': _$AlarmTypeEnumMap[instance.alarmType]!,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
    };

const _$AlarmTypeEnumMap = {
  AlarmType.event: 'event',
  AlarmType.dm: 'dm',
  AlarmType.chat: 'chat',
};
