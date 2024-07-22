import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_model.freezed.dart';
part 'alarm_model.g.dart';

@freezed
class AlarmModel with _$AlarmModel {
  factory AlarmModel({
    required String id,
    required AlarmType alarmType,
    required String title,
    required String content,
    required String date,
  }) = _AlarmModel;

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);
}

enum AlarmType {
  event('이벤트'),
  dm('DM'),
  chat('채팅');

  final String name;

  const AlarmType(this.name);
}
