import 'package:sottie_flutter/model/chat/dto/dm_dto.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

Future<List<DmDTO>> getDmDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    DmDTO(
      id: 123451346,
      userDTO: UserDTO(
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
    DmDTO(
      id: 123451347,
      userDTO: UserDTO(
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
    DmDTO(
      id: 123451348,
      userDTO: UserDTO(
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
