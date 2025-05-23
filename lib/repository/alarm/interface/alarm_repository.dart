import 'package:sottie_flutter/model/alarm/alarm_model.dart';
import 'package:sottie_flutter/repository/alarm/implements/alarm_repo_impl_dev.dart';

abstract interface class AlarmRepository {
  factory AlarmRepository() {
    return AlarmRepoImplDev();
  }

  Future<List<AlarmModel>> getAlarmList();
}
