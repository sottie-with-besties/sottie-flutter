import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/home/home_alarm_model.dart';
import 'package:sottie_flutter/repository/home/implements/home_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/home/implements/home_repo_impl_dummy.dart';

abstract interface class HomeRepository {
  factory HomeRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => HomeRepoImplDummy(),
      ServerEnvironment.dev => HomeRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  Future<List<HomeAlarmModel>> getAlarmList();
}
