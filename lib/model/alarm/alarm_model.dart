import 'package:sottie_flutter/model/alarm/alarm_enum.dart';

class AlarmModel {
  final String id;
  final AlarmType alarmType;
  final String title;
  final String content;
  final String date;

  AlarmModel({
    required this.id,
    required this.alarmType,
    required this.title,
    required this.content,
    required this.date,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      alarmType: AlarmType.values.firstWhere(
        (e) => e.name == json['alarmType'],
      ),
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
