import 'package:sottie_flutter/model/user/user_model.dart';

Future<List<UserModel>> getFriendRequestDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    UserModel(
      id: 1,
      nickname: 'SkyWalker',
      stateMsg: '늘 하늘을 꿈꾸는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 2,
      nickname: 'MoonChild',
      stateMsg: '달을 사랑하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 3,
      nickname: 'StarGazer',
      stateMsg: '별을 바라보며 꿈을 꿉니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
  ];
}
