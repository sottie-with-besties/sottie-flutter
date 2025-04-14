import 'package:sottie_flutter/model/in_chat/dto/in_chat_event_dto.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

Future<InChatEventListDTO> getInChatMessageDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);

  // 채팅에 참여하는 유저 목록
  final List<UserDTO> userList = [
    UserDTO(
      id: 1,
      nickname: "김소띠",
      stateMsg: "소띠 개발자입니다",
      profileUrl: "https://i.pravatar.cc/150?img=1",
      mannerTemperature: 36.5,
    ),
    UserDTO(
      id: 2,
      nickname: "박자바",
      stateMsg: "자바 좋아요",
      profileUrl: "https://i.pravatar.cc/150?img=2",
      mannerTemperature: 37.2,
    ),
    UserDTO(
      id: 3,
      nickname: "이플러터",
      stateMsg: "플러터 개발자",
      profileUrl: "https://i.pravatar.cc/150?img=3",
      mannerTemperature: 38.1,
    ),
    UserDTO(
      id: 4,
      nickname: "최코틀린",
      stateMsg: "안드로이드 개발자입니다",
      profileUrl: "https://i.pravatar.cc/150?img=4",
      mannerTemperature: 36.9,
    ),
  ];

  // 실제 현재 시간을 기준으로 이벤트들을 시간순으로 정렬
  final baseTime1 = DateTime.now().subtract(const Duration(days: 2));
  final baseTime2 = DateTime.now().subtract(const Duration(hours: 2));

  // 이벤트 목록 생성
  final List<InChatEventDTO> eventList = [
    // 채팅방 시작 - 모든 사용자가 동시에 입장
    InChatEventDTO(
      eventId: "1",
      userId: 1,
      inChatEventType: InChatEventType.ENTRANCE.name,
      timeStamp: baseTime1,
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "data_1",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "채팅방에 입장했습니다.",
      ),
    ),

    InChatEventDTO(
      eventId: "2",
      userId: 2,
      inChatEventType: InChatEventType.ENTRANCE.name,
      timeStamp: baseTime1,
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "data_2",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "채팅방에 입장했습니다.",
      ),
    ),

    InChatEventDTO(
      eventId: "3",
      userId: 3,
      inChatEventType: InChatEventType.ENTRANCE.name,
      timeStamp: baseTime1,
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "data_3",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "채팅방에 입장했습니다.",
      ),
    ),

    InChatEventDTO(
      eventId: "4",
      userId: 4,
      inChatEventType: InChatEventType.ENTRANCE.name,
      timeStamp: baseTime1,
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "data_4",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "채팅방에 입장했습니다.",
      ),
    ),

    // 유저 1이 인사 시작
    InChatEventDTO(
      eventId: "5",
      userId: 1,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 1)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_1",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "안녕하세요! 오늘 모임의 주최자인 김소띠입니다.",
      ),
    ),

    // 유저 1이 계속 메시지
    InChatEventDTO(
      eventId: "6",
      userId: 1,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 1, seconds: 15)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_2",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "다들 시간 내주셔서 감사합니다. 오늘은 앱 개발 스터디를 진행할 예정입니다.",
      ),
    ),

    // 유저 2 인사
    InChatEventDTO(
      eventId: "7",
      userId: 2,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 2)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_3",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "반갑습니다! 평소 앱 개발에 관심이 많았어요.",
      ),
    ),

    // 유저 3 인사
    InChatEventDTO(
      eventId: "8",
      userId: 3,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 2, seconds: 30)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_4",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "안녕하세요! 저는 Flutter로 앱 개발하고 있어요.",
      ),
    ),

    // 유저 4 인사
    InChatEventDTO(
      eventId: "9",
      userId: 4,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 3)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_5",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "반갑습니다! 코틀린으로 안드로이드 앱 개발하는 최코틀린입니다.",
      ),
    ),

    // 유저 1이 스터디 주제 설명
    InChatEventDTO(
      eventId: "10",
      userId: 1,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 4)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_6",
        inChatDataType: InChatDataType.TEXT.name,
        contents:
            "오늘은 먼저 각자 자신이 개발 중인 앱에 대해 간단히 소개하고, 그 다음 함께 문제점을 해결해보는 시간을 가져볼게요.",
      ),
    ),

    // 유저 2가 이미지 공유
    InChatEventDTO(
      eventId: "11",
      userId: 2,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 5)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "img_1",
        inChatDataType: InChatDataType.IMAGE.name,
        contents: "https://picsum.photos/seed/app1/500/300",
      ),
    ),

    // 유저 2가 설명
    InChatEventDTO(
      eventId: "12",
      userId: 2,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 5, seconds: 10)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_7",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "저는 지금 쇼핑몰 앱을 개발하고 있어요. UI는 이렇게 디자인했습니다.",
      ),
    ),

    // 유저 3의 반응
    InChatEventDTO(
      eventId: "13",
      userId: 3,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 6)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_8",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "디자인이 정말 깔끔하네요! 어떤 디자인 시스템을 사용하셨나요?",
      ),
    ),

    // 유저 2의 답변
    InChatEventDTO(
      eventId: "14",
      userId: 2,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime1.add(const Duration(minutes: 6, seconds: 30)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_9",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "Material Design을 기반으로 하되, 커스텀 디자인 요소를 많이 추가했어요.",
      ),
    ),

    // 유저 4가 질문
    InChatEventDTO(
      eventId: "15",
      userId: 4,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 7)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_10",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "네트워크 통신은 어떻게 구현하셨나요? Retrofit 사용하시나요?",
      ),
    ),

    // 유저 2의 답변
    InChatEventDTO(
      eventId: "16",
      userId: 2,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 7, seconds: 20)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_11",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "네, Retrofit과 OkHttp를 사용했습니다. 아직 성능 최적화가 필요한 상태예요.",
      ),
    ),

    // 유저 3이 자신의 앱 이미지 공유
    InChatEventDTO(
      eventId: "17",
      userId: 3,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 8)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "img_2",
        inChatDataType: InChatDataType.IMAGE.name,
        contents: "https://picsum.photos/seed/app2/500/300",
      ),
    ),

    // 유저 3이 설명
    InChatEventDTO(
      eventId: "18",
      userId: 3,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 8, seconds: 15)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_12",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "저는 일기 앱을 Flutter로 개발하고 있어요. 로컬 DB와 클라우드 동기화 기능을 구현했습니다.",
      ),
    ),

    // 유저 1의 반응
    InChatEventDTO(
      eventId: "19",
      userId: 1,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 9)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_13",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "와, 동기화는 어떤 방식으로 구현하셨어요? Firebase를 사용하셨나요?",
      ),
    ),

    // 유저 2가 잠시 자리 비움
    InChatEventDTO(
      eventId: "20",
      userId: 2,
      inChatEventType: InChatEventType.CHAT_OUT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 9, seconds: 30)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "sys_0",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "",
      ),
    ),

    // 유저 4가 잠시 자리 비움
    InChatEventDTO(
      eventId: "21",
      userId: 4,
      inChatEventType: InChatEventType.CHAT_OUT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 10)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "sys_1",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "",
      ),
    ),

    // 유저 3의 답변
    InChatEventDTO(
      eventId: "22",
      userId: 3,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 10, seconds: 15)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_14",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "네, Firebase Firestore를 사용했어요. 오프라인 지원도 해서 유용하더라고요.",
      ),
    ),

    // 유저 1이 관심을 보임
    InChatEventDTO(
      eventId: "23",
      userId: 1,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 11)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_15",
        inChatDataType: InChatDataType.TEXT.name,
        contents:
            "오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?오, 저도 비슷한 기능을 구현하려고 했는데 참고할게요! 혹시 코드 샘플을 공유해주실 수 있을까요?",
      ),
    ),

    // 유저 4가 다시 입장
    InChatEventDTO(
      eventId: "24",
      userId: 4,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 12)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "sys_2",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "다시 돌아왔습니다.",
      ),
    ),

    // 유저 4가 자신의 앱 이미지 공유
    InChatEventDTO(
      eventId: "25",
      userId: 4,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 12, seconds: 30)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "img_3",
        inChatDataType: InChatDataType.IMAGE.name,
        contents: "https://picsum.photos/seed/app3/500/300",
      ),
    ),

    // 유저 4가 설명
    InChatEventDTO(
      eventId: "26",
      userId: 4,
      inChatEventType: InChatEventType.CHAT.name,
      timeStamp: baseTime2.add(const Duration(minutes: 12, seconds: 45)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_16",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "제가 개발 중인 피트니스 앱입니다. 운동 루틴 추천과 트래킹 기능을 구현했어요.",
      ),
    ),

    // 유저 4가 설명
    InChatEventDTO(
      eventId: "27",
      userId: 4,
      inChatEventType: InChatEventType.CHAT_IN.name,
      timeStamp: baseTime2.add(const Duration(minutes: 12, seconds: 45)),
      inChatEventStatus: InChatEventStatus.SUCCESS.name,
      inChatData: InChatDataDTO(
        dataId: "msg_12",
        inChatDataType: InChatDataType.TEXT.name,
        contents: "",
      ),
    ),
  ];

  // 역순으로 정렬 (최신 메시지가 인덱스 0에 오도록)
  eventList.sort(
    (a, b) => int.parse(b.eventId).compareTo(int.parse(a.eventId)),
  );

  return InChatEventListDTO(
    roomId: "room_123",
    userList: userList,
    inChatEventList: eventList,
  );
}
