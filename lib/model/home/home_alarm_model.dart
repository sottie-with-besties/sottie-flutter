import 'package:sottie_flutter/model/home/home_alarm_enum.dart';

class HomeAlarmModel {
  final String id;
  final HomeAlarmType alarmType;
  final String title;
  final String content;
  final String date;

  HomeAlarmModel({
    required this.id,
    required this.alarmType,
    required this.title,
    required this.content,
    required this.date,
  });

  factory HomeAlarmModel.fromJson(Map<String, dynamic> json) {
    return HomeAlarmModel(
      id: json['id'],
      alarmType: HomeAlarmType.values.firstWhere(
        (e) => e.name == json['alarmType'],
      ),
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
