import 'package:sottie_flutter/model/home/home_alarm_enum.dart';
import 'package:sottie_flutter/model/home/home_alarm_model.dart';
import 'package:sottie_flutter/repository/home/interface/home_repository.dart';

final class HomeRepoImplDummy implements HomeRepository {
  @override
  Future<List<HomeAlarmModel>> getAlarmList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      HomeAlarmModel(
        id: "1001",
        alarmType: HomeAlarmType.event,
        title: "더미 이벤트 알림",
        content: "이것은 더미 이벤트 알림입니다",
        date: '8월 5일',
      ),
      HomeAlarmModel(
        id: "1002",
        alarmType: HomeAlarmType.dm,
        title: "김철수",
        content: "더미 DM 메시지입니다",
        date: '오후 2:30',
      ),
      HomeAlarmModel(
        id: "1003",
        alarmType: HomeAlarmType.chat,
        title: "더미 채팅방",
        content: "더미 채팅 알림입니다",
        date: '오전 11:45',
      ),
      HomeAlarmModel(
        id: "1004",
        alarmType: HomeAlarmType.event,
        title: "더미 이벤트 당첨 안내",
        content: "더미 이벤트에 당첨되셨습니다",
        date: '8월 6일',
      ),
      HomeAlarmModel(
        id: "1005",
        alarmType: HomeAlarmType.dm,
        title: "이영희",
        content: "더미 메시지 확인해주세요",
        date: '오후 5:15',
      ),
      HomeAlarmModel(
        id: "1006",
        alarmType: HomeAlarmType.chat,
        title: "더미 스터디 모임",
        content: "더미 스터디 모임 확인해주세요",
        date: '오후 7:00',
      ),
      HomeAlarmModel(
        id: "1007",
        alarmType: HomeAlarmType.event,
        title: "더미 프로모션 안내",
        content: "더미 프로모션이 시작되었습니다",
        date: '8월 7일',
      ),
      HomeAlarmModel(
        id: "1008",
        alarmType: HomeAlarmType.dm,
        title: "박민수",
        content: "더미 DM 문의입니다",
        date: '오전 9:20',
      ),
      HomeAlarmModel(
        id: "1009",
        alarmType: HomeAlarmType.chat,
        title: "더미 운동 모임",
        content: "더미 운동 모임 참여자를 모집합니다",
        date: '오후 6:30',
      ),
      HomeAlarmModel(
        id: "1010",
        alarmType: HomeAlarmType.event,
        title: "더미 할인 쿠폰",
        content: "더미 할인 쿠폰이 발급되었습니다",
        date: '8월 8일',
      ),
    ];
  }
}
