import 'package:sottie_flutter/data/chat/model/dm_model.dart';

Future<List<DmModel>> getDmDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    DmModel(
      id: 123451346,
      nickName: "김진표",
      latestMsg: "반갑습니다!",
      latestTime: DateTime(2024),
      notReadMsg: 234,
    ),
    DmModel(
      id: 123451347,
      nickName: "박수영",
      latestMsg: "안녕하세요!",
      latestTime: DateTime(2024),
      notReadMsg: 12,
    ),
    DmModel(
      id: 123451348,
      nickName: "이민호",
      latestMsg: "다음에 뵈어요!",
      latestTime: DateTime(2024),
      notReadMsg: 78,
    ),
  ];
}
