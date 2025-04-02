import 'package:sottie_flutter/model/user/dto/user_dto.dart';

Future<UserDTO?> getUserSearchDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return UserDTO(
    id: 32,
    nickname: 'nickname',
    stateMsg: 'stateMsg',
    profileUrl: null,
    mannerTemperature: 37.5,
  );
}
