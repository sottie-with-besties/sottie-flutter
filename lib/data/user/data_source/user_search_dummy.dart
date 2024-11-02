import 'package:sottie_flutter/data/user/model/user_model.dart';

Future<UserModel?> getUserSearchDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return UserModel(
    id: 'usersearch',
    nickname: 'nickname',
    stateMsg: 'stateMsg',
    profileUrl: null,
  );
}
