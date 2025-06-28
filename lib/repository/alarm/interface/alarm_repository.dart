import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/alarm/alarm_model.dart';
import 'package:sottie_flutter/repository/alarm/implements/alarm_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/alarm/implements/alarm_repo_impl_dummy.dart';

abstract interface class AlarmRepository {
  factory AlarmRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => AlarmRepoImplDummy(),
      ServerEnvironment.dev => AlarmRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  Future<List<AlarmModel>> getAlarmList();
}
