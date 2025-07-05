import 'dart:developer';

import 'package:sottie_flutter/model/home/home_alarm_model.dart';
import 'package:sottie_flutter/repository/home/interface/home_repository.dart';

sealed class HomeUseCase {
  static final _repo = HomeRepository();

  /// 알림 목록 가져오기
  static Future<List<HomeAlarmModel>> getAlarmList() async {
    try {
      final alarmList = await _repo.getAlarmList();
      return alarmList;
    } catch (e) {
      log("Error fetching alarm list: $e");
      return [];
    }
  }
}
