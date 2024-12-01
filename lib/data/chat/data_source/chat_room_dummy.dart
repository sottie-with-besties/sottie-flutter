import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';

Future<List<ChatRoomModel>> getChatRoomDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [
    ChatRoomModel(
      id: 1,
      gatheringCategory: '구인/구직',
      gatheringDate: DateTime(2024, 12, 5, 8, 50),
      locationId: 2,
      chatTitle: '친목 모임: 가벼운 저녁 식사',
      profileThumbnailsUrl: ['1', '32', '42', '123'],
      latestMsg: '출발 시간은 7시 맞죠?',
      latestTime: DateTime(2024),
      notReadMsg: 32,
      currentPeopleNum: 4,
      peopleNum: 5,
      currentMaleNum: 2,
      maleNum: 3,
      currentFemaleNum: 2,
      femaleNum: 2,
      ageRange: [],
      onlyMyFriends: true,
      genderRestriction: 'NONE',
      mannerRestriction: true,
      ageRestriction: true,
    ),
    ChatRoomModel(
      id: 2,
      gatheringCategory: '구인/구직',
      gatheringDate: _renderDeletingDate(),
      locationId: 2,
      chatTitle: '친목 모임: 가벼운 저녁 식사',
      profileThumbnailsUrl: ['1', '32', '42', '123'],
      latestMsg: '출발 시간은 7시 맞죠?',
      latestTime: DateTime(2024),
      notReadMsg: 32,
      currentPeopleNum: 4,
      peopleNum: 5,
      currentMaleNum: 5,
      maleNum: 5,
      currentFemaleNum: 0,
      femaleNum: 0,
      ageRange: [],
      onlyMyFriends: true,
      genderRestriction: 'MALE',
      mannerRestriction: true,
      ageRestriction: true,
    ),
  ];
}

DateTime _renderDeletingDate() =>
    DateTime(2024, DateTime.now().month, DateTime.now().day - 1).toLocal();
