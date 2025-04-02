import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_dto.freezed.dart';
part 'alarm_dto.g.dart';

@freezed
sealed class AlarmDTO with _$AlarmDTO {
  factory AlarmDTO({
    required String id,
    required AlarmType alarmType,
    required String title,
    required String content,
    required String date,
  }) = _AlarmDTO;

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
