import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/chat/interface/chat_repository.dart';

final class ChatRepoImplDev implements ChatRepository {
  @override
  Future<List<ChatRoomModel>> getChatRoomList() async {
    await Future.delayed(const Duration(seconds: 1), null);
    return [
      ChatRoomModel(
        id: 1,
        sottieCategory: 'THUNDER',
        gatheringDate: DateTime(2025, 4, 12, 8, 50),
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

        genderRestriction: 'NONE',
        mannerRestriction: true,
        ageRestriction: true,
      ),
      ChatRoomModel(
        id: 2,
        sottieCategory: 'EXERCISE',
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

        genderRestriction: 'MIX',
        mannerRestriction: true,
        ageRestriction: true,
      ),
    ];
  }

  @override
  Future<List<PostModel>> getChatRoomWaitingList() async {
    await Future.delayed(const Duration(seconds: 1), null);
    return [
      PostModel(
        id: 3,
        postCategory: PostCategory.THUNDER,
        title: '안녕하세요',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024),
        contents: '안녕하세요안녕하세요',
        numOfCurrentPeople: 3,
        numOfPeople: 5,
        numOfCurrentMale: 1,
        numOfMale: 3,
        numOfCurrentFemale: 2,
        numOfFemale: 2,
        ageFrom: 2,
        ageTo: 5,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      PostModel(
        id: 3,
        postCategory: PostCategory.THUNDER,
        title: '안녕하세요',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024),
        contents: '안녕하세요안녕하세요',
        numOfCurrentPeople: 4,
        numOfPeople: 5,
        numOfCurrentMale: 4,
        numOfMale: 5,
        numOfCurrentFemale: 0,
        numOfFemale: 0,
        ageFrom: 2,
        ageTo: 5,
        genderRestriction: PostGenderRestriction.MALE,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      PostModel(
        id: 3,
        postCategory: PostCategory.THUNDER,
        title: '안녕하세요',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024),
        contents: '안녕하세요안녕하세요',
        numOfCurrentPeople: 3,
        numOfPeople: 5,
        numOfCurrentMale: 2,
        numOfMale: 3,
        numOfCurrentFemale: 2,
        numOfFemale: 2,
        ageFrom: 2,
        ageTo: 5,
        genderRestriction: PostGenderRestriction.MIX,
        mannerRestriction: true,
        ageRestriction: true,
      ),
    ];
  }

  @override
  Future<List<DmModel>> getDmList() async {
    await Future.delayed(const Duration(seconds: 1), null);
    return [
      DmModel(
        id: 123451346,
        userModel: UserModel(
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
      DmModel(
        id: 123451347,
        userModel: UserModel(
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
      DmModel(
        id: 123451348,
        userModel: UserModel(
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
}

DateTime _renderDeletingDate() =>
    DateTime(2025, DateTime.now().month, DateTime.now().day - 1).toLocal();
