import 'package:sottie_flutter/data/dm/model/dm_model.dart';

Future<List<DmModel>> getDmDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    DmModel(
      id: '123451346',
      inDmId: '8903457893459',
      name: "김진표",
      latestMsg: "반갑습니다!",
      latestTime: "오후 11:00",
      notReadMsg: 234,
    ),
    DmModel(
      id: '123451347',
      inDmId: '8903457893460',
      name: "박수영",
      latestMsg: "안녕하세요!",
      latestTime: "오전 9:00",
      notReadMsg: 12,
    ),
    DmModel(
      id: '123451348',
      inDmId: '8903457893461',
      name: "이민호",
      latestMsg: "다음에 뵈어요!",
      latestTime: "7월 3일",
      notReadMsg: 78,
    ),
    DmModel(
      id: '123451349',
      inDmId: '8903457893462',
      name: "정지훈",
      latestMsg: "좋은 하루 되세요!",
      latestTime: "9월 5일",
      notReadMsg: 45,
    ),
    DmModel(
      id: '123451350',
      inDmId: '8903457893463',
      name: "최수정",
      latestMsg: "감사합니다!",
      latestTime: "오후 11:00",
      notReadMsg: 60,
    ),
    DmModel(
      id: '123451351',
      inDmId: '8903457893464',
      name: "홍길동",
      latestMsg: "오늘 만나서 반가웠어요.",
      latestTime: "오전 9:00",
      notReadMsg: 34,
    ),
    DmModel(
      id: '123451352',
      inDmId: '8903457893465',
      name: "김혜수",
      latestMsg: "내일 뵙겠습니다.",
      latestTime: "7월 3일",
      notReadMsg: 120,
    ),
    DmModel(
      id: '123451353',
      inDmId: '8903457893466',
      name: "한지민",
      latestMsg: "오랜만이에요!",
      latestTime: "9월 5일",
      notReadMsg: 89,
    ),
    DmModel(
      id: '123451354',
      inDmId: '8903457893467',
      name: "강동원",
      latestMsg: "잘 지내시죠?",
      latestTime: "오후 11:00",
      notReadMsg: 150,
    ),
    DmModel(
      id: '123451355',
      inDmId: '8903457893468',
      name: "송중기",
      latestMsg: "좋은 밤 되세요!",
      latestTime: "오전 9:00",
      notReadMsg: 5,
    ),
  ];
}
