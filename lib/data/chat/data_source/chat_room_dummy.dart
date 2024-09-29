import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';

Future<List<ChatRoomModel>> getChatRoomDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    ChatRoomModel(
      id: '1',
      inChatId: 'chat_1',
      profileThumbnails: ['thumb1.jpg'],
      category: ['번개'],
      date: '2024-09-10T03:15:00Z',
      location: '서울 강남구',
      chatTitle: '번개 모임: 당일 만나요!',
      latestMsg: '안녕하세요! 반갑습니다. 수원 사는 김진표라고 합니다.',
      latestTime: '2024-09-14T07:55:00Z',
      notReadMsg: 1024,
      isChatRoomGenerated: true,
      currentMemberCount: 5,
      maxMemberCount: 10,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '2',
      inChatId: 'chat_2',
      profileThumbnails: ['thumb2.jpg', 'thumb3.jpg'],
      category: ['친목', '운동'],
      date: '2024-09-11T07:30:00Z',
      location: '서울 마포구',
      chatTitle: '친목운동: 같이 운동할 친구 찾아요!',
      latestMsg: '운동 어디서 할까요?',
      latestTime: '2024-09-14T08:00:00Z',
      notReadMsg: 885,
      isChatRoomGenerated: false,
      currentMemberCount: null,
      maxMemberCount: null,
      currentManCount: 6,
      maxManCount: 8,
      currentWomanCount: 4,
      maxWomanCount: 5,
    ),
    ChatRoomModel(
      id: '3',
      inChatId: 'chat_3',
      profileThumbnails: ['thumb4.jpg'],
      category: ['공부'],
      date: '2024-09-12T05:45:00Z',
      location: '서울 종로구',
      chatTitle: '스터디 그룹 모집: 영어 공부',
      latestMsg: '스터디 시작 언제 할까요?',
      latestTime: '2024-09-14T10:30:00Z',
      notReadMsg: 300,
      isChatRoomGenerated: true,
      currentMemberCount: 7,
      maxMemberCount: 7,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '4',
      inChatId: 'chat_4',
      profileThumbnails: ['thumb5.jpg', 'thumb6.jpg'],
      category: ['게임', '기타'],
      date: '2024-09-13T11:20:00Z',
      location: '서울 강북구',
      chatTitle: '게임 모임: 다양한 게임 하실 분!',
      latestMsg: '오늘 저녁 게임하실 분?',
      latestTime: '2024-09-14T13:45:00Z',
      notReadMsg: 51,
      isChatRoomGenerated: false,
      currentMemberCount: null,
      maxMemberCount: null,
      currentManCount: 5,
      maxManCount: 7,
      currentWomanCount: 2,
      maxWomanCount: 3,
    ),
    ChatRoomModel(
      id: '5',
      inChatId: 'chat_5',
      profileThumbnails: ['thumb7.jpg'],
      category: ['운동'],
      date: '2024-09-14T08:50:00Z',
      location: '서울 성동구',
      chatTitle: '운동 모임: 함께하는 조깅!',
      latestMsg: '조깅 시간 언제가 좋을까요?',
      latestTime: '2024-09-14T16:00:00Z',
      notReadMsg: 0,
      isChatRoomGenerated: true,
      currentMemberCount: 4,
      maxMemberCount: 6,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '6',
      inChatId: 'chat_6',
      profileThumbnails: ['thumb8.jpg', 'thumb9.jpg', 'thumb10.jpg'],
      category: ['구인/구직'],
      date: '2024-09-15T09:35:00Z',
      location: '서울 동대문구',
      chatTitle: '구인/구직: IT 프로젝트 팀원 모집',
      latestMsg: '다음 회의 언제 할까요?',
      latestTime: '2024-09-14T19:15:00Z',
      notReadMsg: 42,
      isChatRoomGenerated: false,
      currentMemberCount: null,
      maxMemberCount: null,
      currentManCount: 3,
      maxManCount: 5,
      currentWomanCount: 2,
      maxWomanCount: 4,
    ),
    ChatRoomModel(
      id: '7',
      inChatId: 'chat_7',
      profileThumbnails: ['thumb11.jpg'],
      category: ['친목'],
      date: '2024-09-16T12:00:00Z',
      location: '서울 은평구',
      chatTitle: '친목 모임: 새로운 친구와의 만남!',
      latestMsg: '언제 만날까요?',
      latestTime: '2024-09-12T14:00:00Z',
      notReadMsg: 3,
      isChatRoomGenerated: true,
      currentMemberCount: 6,
      maxMemberCount: 10,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '8',
      inChatId: 'chat_8',
      profileThumbnails: ['thumb12.jpg', 'thumb13.jpg'],
      category: ['게임'],
      date: '2024-09-17T18:30:00Z',
      location: '서울 용산구',
      chatTitle: '게임 팀 모집: 실력자 환영!',
      latestMsg: '팀원 다 구했나요?',
      latestTime: '2024-09-11T09:10:00Z',
      notReadMsg: 6,
      isChatRoomGenerated: false,
      currentMemberCount: null,
      maxMemberCount: null,
      currentManCount: 7,
      maxManCount: 10,
      currentWomanCount: 1,
      maxWomanCount: 3,
    ),
    ChatRoomModel(
      id: '9',
      inChatId: 'chat_9',
      profileThumbnails: ['thumb14.jpg', 'thumb15.jpg', 'thumb16.jpg'],
      category: ['공부', '번개'],
      date: '2024-09-18T14:40:00Z',
      location: '서울 서대문구',
      chatTitle: '번개 공부 모임: 오늘 바로 시작!',
      latestMsg: '어디서 만날까요?',
      latestTime: '2024-09-11T18:20:00Z',
      notReadMsg: 20,
      isChatRoomGenerated: true,
      currentMemberCount: 8,
      maxMemberCount: 8,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '10',
      inChatId: 'chat_10',
      profileThumbnails: ['thumb17.jpg'],
      category: ['운동', '기타'],
      date: '2024-09-19T11:15:00Z',
      location: '서울 강동구',
      chatTitle: '운동 모임: 새로운 운동 함께 배워요!',
      latestMsg: '장소는 어디인가요?',
      latestTime: '2024-09-10T11:05:00Z',
      notReadMsg: 0,
      isChatRoomGenerated: false,
      currentMemberCount: null,
      maxMemberCount: null,
      currentManCount: 6,
      maxManCount: 8,
      currentWomanCount: 2,
      maxWomanCount: 3,
    ),
    ChatRoomModel(
      id: '11',
      inChatId: 'chat_11',
      profileThumbnails: ['thumb18.jpg', 'thumb19.jpg'],
      category: ['친목'],
      date: '2024-09-20T15:30:00Z',
      location: '서울 노원구',
      chatTitle: '친목 모임: 영화 같이 보실 분?',
      latestMsg: '영화 선택 끝났나요?',
      latestTime: '2024-09-07T13:25:00Z',
      notReadMsg: 0,
      isChatRoomGenerated: true,
      currentMemberCount: 4,
      maxMemberCount: 6,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
    ChatRoomModel(
      id: '12',
      inChatId: 'chat_12',
      profileThumbnails: ['thumb20.jpg', 'thumb21.jpg', 'thumb22.jpg'],
      category: ['기타'],
      date: '2024-09-21T10:30:00Z',
      location: '서울 송파구',
      chatTitle: '기타 모임: 다양한 취미 공유',
      latestMsg: '다음 모임 언제 할까요?',
      latestTime: '2024-09-07T22:10:00Z',
      notReadMsg: 1,
      isChatRoomGenerated: false,
      currentMemberCount: 4,
      maxMemberCount: 6,
      currentManCount: null,
      maxManCount: null,
      currentWomanCount: null,
      maxWomanCount: null,
    ),
  ];
}
