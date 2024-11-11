import 'package:sottie_flutter/data/chat/model/dm_model.dart';

Future<List<DmModel>> getDmDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    DmModel(
      id: '123451346',
      nickName: "김진표",
      latestMsg: "반갑습니다!",
      latestTime: "2024-09-29T14:00:00Z",
      // 오후 11:00 -> UTC 14:00
      notReadMsg: 234,
    ),
    DmModel(
      id: '123451347',
      nickName: "박수영",
      latestMsg: "안녕하세요!",
      latestTime: "2024-09-14T00:00:00Z",
      // 오전 9:00 -> UTC 00:00
      notReadMsg: 12,
    ),
    DmModel(
      id: '123451348',
      nickName: "이민호",
      latestMsg: "다음에 뵈어요!",
      latestTime: "2024-07-03T00:00:00Z",
      // 7월 3일 -> Preserved date with midnight UTC
      notReadMsg: 78,
    ),
    DmModel(
      id: '123451349',
      nickName: "정지훈",
      latestMsg: "좋은 하루 되세요!",
      latestTime: "2024-09-05T00:00:00Z",
      // 9월 5일 -> Preserved date with midnight UTC
      notReadMsg: 45,
    ),
    DmModel(
      id: '123451350',
      nickName: "최수정",
      latestMsg: "감사합니다!",
      latestTime: "2024-09-14T14:00:00Z",
      // 오후 11:00 -> UTC 14:00
      notReadMsg: 60,
    ),
    DmModel(
      id: '123451351',
      nickName: "홍길동",
      latestMsg: "오늘 만나서 반가웠어요.",
      latestTime: "2024-09-14T00:00:00Z",
      // 오전 9:00 -> UTC 00:00
      notReadMsg: 34,
    ),
    DmModel(
      id: '123451352',
      nickName: "김혜수",
      latestMsg: "내일 뵙겠습니다.",
      latestTime: "2024-07-03T00:00:00Z",
      // 7월 3일 -> Preserved date with midnight UTC
      notReadMsg: 120,
    ),
    DmModel(
      id: '123451353',
      nickName: "한지민",
      latestMsg: "오랜만이에요!",
      latestTime: "2024-09-05T00:00:00Z",
      // 9월 5일 -> Preserved date with midnight UTC
      notReadMsg: 89,
    ),
    DmModel(
      id: '123451354',
      nickName: "강동원",
      latestMsg: "잘 지내시죠?",
      latestTime: "2024-09-14T14:00:00Z",
      // 오후 11:00 -> UTC 14:00
      notReadMsg: 150,
    ),
    DmModel(
      id: '123451355',
      nickName: "송중기",
      latestMsg: "좋은 밤 되세요!",
      latestTime: "2024-09-14T00:00:00Z",
      // 오전 9:00 -> UTC 00:00
      notReadMsg: 5,
    ),
  ];
}
