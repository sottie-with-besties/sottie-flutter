import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room.dart';

class ChatContentScreen extends StatelessWidget {
  const ChatContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatList = _dummy.map((Map<String, Object> data) {
      return ChatRoom(roomInfo: data);
    }).toList();

    return Column(children: chatList);
  }
}

const _dummy = [
  {
    'date': '2024년 6월 12일 14:00',
    'location': '수원역 스타벅스',
    'chatTitle': '카페에서 커피한잔~',
    'latestMsg': '지금 출발하겠습니다 ㅎㅎ',
    'numOfMember': 3,
    'latestTime': '오전 11:00',
    'notReadMsg': 256,
  },
  {
    'date': '2024년 6월 13일 10:30',
    'location': '서울특별시 강남역 3번출구 투썸플레이스',
    'chatTitle': '아침 모임',
    'latestMsg': '다들 시간 맞추기 어려우시죠?',
    'numOfMember': 5,
    'latestTime': '5월 27일',
    'notReadMsg': 1024,
  },
  {
    'date': '2024년 6월 14일 18:00',
    'location': '홍대입구역 블루보틀',
    'chatTitle': '저녁 모임',
    'latestMsg': '저녁 뭐 먹을까요?',
    'numOfMember': 4,
    'latestTime': '5월 6일',
    'notReadMsg': 0,
  },
  {
    'date': '2024년 6월 15일 12:00',
    'location': '서울역 엔젤리너스',
    'chatTitle': '점심 모임',
    'latestMsg': '점심 추천 메뉴 있어요?',
    'numOfMember': 1,
    'latestTime': '07:00',
    'notReadMsg': 23,
  },
  {
    'date': '2024년 6월 16일 09:00',
    'location': '이태원역 폴바셋',
    'chatTitle': '조찬 모임',
    'latestMsg': '아침 메뉴가 고민되네요.',
    'numOfMember': 2,
    'latestTime': '오후 03:27',
    'notReadMsg': 0,
  },
  {
    'date': '2024년 6월 17일 15:00',
    'location': '잠실역 커피빈',
    'chatTitle': '오후 커피 타임',
    'latestMsg': '오후 3시 어떠세요?',
    'numOfMember': 3,
    'latestTime': '1년 전',
    'notReadMsg': 999,
  },
  {
    'date': '2024년 6월 18일 20:00',
    'location': '신촌역 스타벅스',
    'chatTitle': '야간 모임',
    'latestMsg': '밤 늦게도 좋을까요?',
    'numOfMember': 4,
    'latestTime': '2년 전',
    'notReadMsg': 875,
  },
];
