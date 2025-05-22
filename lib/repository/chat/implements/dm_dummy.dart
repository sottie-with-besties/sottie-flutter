import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';

Future<List<DmModel>> getDmDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    DmModel(
      id: 123451346,
      userModel: UserModel(
        id: 527,
        nickname: '김진표',
        stateMsg: '아아아아아아',
        profileUrl: null,
        mannerTemperature: 51.2,
      ),
      latestMsg: "반갑습니다!",
      latestTime: DateTime(2024),
      notReadMsg: 234,
    ),
    DmModel(
      id: 123451347,
      userModel: UserModel(
        id: 2323,
        nickname: '박수영',
        stateMsg: 'ㅁㅁㄴㅇㄴㅇㄹㅁ',
        profileUrl: null,
        mannerTemperature: 51.2,
      ),
      latestMsg: "안녕하세요!",
      latestTime: DateTime(2024),
      notReadMsg: 12,
    ),
    DmModel(
      id: 123451348,
      userModel: UserModel(
        id: 112,
        nickname: '이민호',
        stateMsg: 'ㅁㄴㅇㄹㅁㄴㅇㄹㄴㅇㅁ',
        profileUrl: null,
        mannerTemperature: 51.2,
      ),
      latestMsg: "다음에 뵈어요!",
      latestTime: DateTime(2024),
      notReadMsg: 78,
    ),
  ];
}
