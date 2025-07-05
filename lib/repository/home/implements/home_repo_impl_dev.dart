import 'package:sottie_flutter/model/home/home_alarm_model.dart';
import 'package:sottie_flutter/repository/home/interface/home_repository.dart';

final class HomeRepoImplDev implements HomeRepository {
  @override
  Future<List<HomeAlarmModel>> getAlarmList() async {
    // Todo: Rest Api 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }
}
