import 'package:sottie_flutter/model/alarm/alarm_model.dart';
import 'package:sottie_flutter/repository/alarm/interface/alarm_repository.dart';

final class AlarmRepoImplDev implements AlarmRepository {
  @override
  Future<List<AlarmModel>> getAlarmList() async {
    // Todo: Rest Api 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }
}
