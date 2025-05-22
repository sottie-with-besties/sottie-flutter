import 'package:sottie_flutter/model/user/user_model.dart';

Future<List<UserModel>> getUserBlockDummy() async {
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
    UserModel(
      id: 4,
      nickname: 'SunSeeker',
      stateMsg: '태양을 향해 달려갑니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 5,
      nickname: 'PlanetExplorer',
      stateMsg: '행성을 탐험하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 6,
      nickname: 'CosmicTraveler',
      stateMsg: '우주를 여행하는 방랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 7,
      nickname: 'AstroNomad',
      stateMsg: '별 사이를 떠도는 유랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 8,
      nickname: 'CosmicTraveler',
      stateMsg: '우주를 여행하는 방랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 9,
      nickname: 'AstroNomad',
      stateMsg: '별 사이를 떠도는 유랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
  ];
}
