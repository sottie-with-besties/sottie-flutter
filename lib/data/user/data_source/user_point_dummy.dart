import 'dart:math';

import 'package:sottie_flutter/data/user/model/user_point_model.dart';

Future<UserPointModel> getUserPointDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return UserPointModel(
    participationValue: _randomPoint(),
    attitudeValue: _randomPoint(),
    timeValue: _randomPoint(),
    likeabilityValue: _randomPoint(),
    trustworthinessValue: _randomPoint(),
  );
}

double _randomPoint() {
  // 0~20.0 사이의 랜덤한 실수를 소수점 첫째자리까지 생성
  return double.parse((Random().nextDouble() * 20.0).toStringAsFixed(1));
}
