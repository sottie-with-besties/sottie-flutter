import 'package:sottie_flutter/model/user/dto/user_dto.dart';

Future<List<UserDTO>> getFriendDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    UserDTO(
      id: 1,
      nickname: 'SkyWalker',
      stateMsg: '늘 하늘을 꿈꾸는 사람입니다.',
      profileUrl:
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fce8Ad2%2FbtsJDujvc9s%2FrOyCoGTkrDxPQHR64hPZAK%2Ftfile.dat',
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 2,
      nickname: 'MoonChild',
      stateMsg: '달을 사랑하는 사람입니다.',
      profileUrl:
          'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR',
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 3,
      nickname: 'StarGazer',
      stateMsg: '별을 바라보며 꿈을 꿉니다.',
      profileUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2d3IW4R8PR4TO7Va-lOAV6PrrYh250bqJpw&s',
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 4,
      nickname: 'SunSeeker',
      stateMsg: '태양을 향해 달려갑니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 5,
      nickname: 'CometHunter',
      stateMsg: '혜성을 추적하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 6,
      nickname: 'NebulaDreamer',
      stateMsg: '성운 속에서 꿈을 꿉니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 7,
      nickname: 'GalaxyVoyager',
      stateMsg: '은하수를 항해합니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 8,
      nickname: 'PlanetExplorer',
      stateMsg: '행성을 탐험하는 사람입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 9,
      nickname: 'CosmicTraveler',
      stateMsg: '우주를 여행하는 방랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
    UserDTO(
      id: 10,
      nickname: 'AstroNomad',
      stateMsg: '별 사이를 떠도는 유랑자입니다.',
      profileUrl: null,
      mannerTemperature: 36.1,
    ),
  ];
}
