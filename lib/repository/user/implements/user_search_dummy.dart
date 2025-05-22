import 'package:sottie_flutter/model/user/user_model.dart';

Future<UserModel?> getUserSearchDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return UserModel(
    id: 32,
    nickname: 'nickname',
    stateMsg: 'stateMsg',
    profileUrl: null,
    mannerTemperature: 37.5,
  );
}
