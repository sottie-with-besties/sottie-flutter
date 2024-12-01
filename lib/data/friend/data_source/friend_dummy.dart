import 'package:sottie_flutter/data/user/model/user_model.dart';

Future<List<UserModel>> getFriendDummy() async {
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
      nickname: 'CometHunter',
      stateMsg: '혜성을 추적하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 6,
      nickname: 'NebulaDreamer',
      stateMsg: '성운 속에서 꿈을 꿉니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 7,
      nickname: 'GalaxyVoyager',
      stateMsg: '은하수를 항해합니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 8,
      nickname: 'PlanetExplorer',
      stateMsg: '행성을 탐험하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 9,
      nickname: 'CosmicTraveler',
      stateMsg: '우주를 여행하는 방랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserModel(
      id: 10,
      nickname: 'AstroNomad',
      stateMsg: '별 사이를 떠도는 유랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
  ];
}
