import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';

Future<List<ChatRoomModel>> getChatRoomDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    ChatRoomModel(
      id: 1,
      gatheringCategory: 'THUNDER',
      gatheringDate: DateTime(2025, 1, 3, 8, 50),
      locationId: 2,
      title: '친목 모임: 가벼운 저녁 식사',
      profileThumbnailsUrl: ['1', '32', '42', '123'],
      latestMsg: '출발 시간은 7시 맞죠?',
      latestTime: DateTime(2024),
      notReadMsg: 32,
      contents: '저녁에 모여서 맛있는 저녁 식사 함께 해요',
      currentPeopleNum: 4,
      peopleNum: 5,
      currentMaleNum: 2,
      maleNum: 3,
      currentFemaleNum: 2,
      femaleNum: 2,
      ageFrom: 2,
      ageTo: 5,
      onlyMyFriends: true,
      genderRestriction: 'NONE',
      mannerRestriction: true,
      ageRestriction: true,
    ),
    ChatRoomModel(
      id: 2,
      gatheringCategory: 'EXERCISE',
      gatheringDate: _renderDeletingDate(),
      locationId: 2,
      title: '플러터 개발자 구합니다',
      profileThumbnailsUrl: ['1', '32', '42', '123'],
      latestMsg: '리버팟 사용할 줄 아시나요?',
      latestTime: DateTime(2024),
      notReadMsg: 32,
      contents: '플러터 잘하시는 분 구합니다',
      currentPeopleNum: 4,
      peopleNum: 5,
      currentMaleNum: 5,
      maleNum: 5,
      currentFemaleNum: 0,
      femaleNum: 0,
      ageFrom: 2,
      ageTo: 5,
      onlyMyFriends: true,
      genderRestriction: 'MIX',
      mannerRestriction: true,
      ageRestriction: true,
    ),
  ];
}

DateTime _renderDeletingDate() =>
    DateTime(2025, DateTime.now().month, DateTime.now().day - 1).toLocal();
