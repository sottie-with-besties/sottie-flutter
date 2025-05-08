import 'package:json_annotation/json_annotation.dart';

part 'alarm_dto.g.dart';

@JsonSerializable()
class AlarmDTO {
  final String id;
  final AlarmType alarmType;
  final String title;
  final String content;
  final String date;

  AlarmDTO({
    required this.id,
    required this.alarmType,
    required this.title,
    required this.content,
    required this.date,
  });

  factory AlarmDTO.fromJson(Map<String, dynamic> json) =>
      _$AlarmDTOFromJson(json);
}

enum AlarmType {
  event('이벤트'),
  dm('DM'),
  chat('채팅');

  final String name;

  const AlarmType(this.name);
}
