import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/chat/interface/chat_repository.dart';

final class ChatRepoImplDummy implements ChatRepository {
  @override
  Future<List<ChatRoomModel>> getChatRoomList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      ChatRoomModel(
        id: 101,
        sottieCategory: PostCategory.FRIENDSHIP,
        gatheringDate: DateTime(2024, 8, 20, 19, 30),
        location: PostLocation.seoul,
        title: '[더미] 주말 한강 피크닉 모임',
        profileThumbnailsUrl: ['dummy1', 'dummy2', 'dummy3'],
        latestMsg: '준비물은 따로 필요 없을까요?',
        latestTime: DateTime.now().subtract(const Duration(minutes: 30)),
        notReadMsg: 5,
        contents: '주말에 한강에서 피크닉 하실 분들 모집합니다. 간단한 음료와 간식 준비해 오세요!',
        currentPeopleNum: 3,
        peopleNum: 6,
        currentMaleNum: 1,
        maleNum: 3,
        currentFemaleNum: 2,
        femaleNum: 3,
        ageFrom: 20,
        ageTo: 30,
        genderRestriction: PostGenderRestriction.MIX,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      ChatRoomModel(
        id: 102,
        sottieCategory: PostCategory.STUDY,
        gatheringDate: DateTime(2024, 8, 15, 14, 0),
        location: PostLocation.seoul,
        title: '[더미] 플러터 스터디 그룹',
        profileThumbnailsUrl: ['dummy4', 'dummy5', 'dummy6', 'dummy7'],
        latestMsg: '이번주 스터디 주제는 상태관리입니다',
        latestTime: DateTime.now().subtract(const Duration(hours: 2)),
        notReadMsg: 12,
        contents: '플러터 개발자들 모여서 함께 공부해요. 주 1회 오프라인 스터디 진행합니다.',
        currentPeopleNum: 4,
        peopleNum: 5,
        currentMaleNum: 3,
        maleNum: 3,
        currentFemaleNum: 1,
        femaleNum: 2,
        ageFrom: 25,
        ageTo: 35,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: false,
        ageRestriction: false,
      ),
      ChatRoomModel(
        id: 103,
        sottieCategory: PostCategory.EXERCISE,
        gatheringDate: DateTime(2024, 8, 12, 20, 0),
        location: PostLocation.suwon,
        title: '[더미] 수원 풋살 인원 모집',
        profileThumbnailsUrl: ['dummy8', 'dummy9'],
        latestMsg: '장소 대여는 제가 했습니다',
        latestTime: DateTime.now().subtract(const Duration(days: 1)),
        notReadMsg: 0,
        contents: '수원에서 주 1회 풋살 할 멤버 구합니다. 실력 무관, 열정만 있으면 OK!',
        currentPeopleNum: 2,
        peopleNum: 10,
        currentMaleNum: 2,
        maleNum: 10,
        currentFemaleNum: 0,
        femaleNum: 0,
        ageFrom: 20,
        ageTo: 40,
        genderRestriction: PostGenderRestriction.MALE,
        mannerRestriction: true,
        ageRestriction: false,
      ),
    ];
  }

  @override
  Future<List<PostModel>> getChatRoomWaitingList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      PostModel(
        id: 201,
        postCategory: PostCategory.GAME,
        title: '[더미] LOL 같이 할 사람',
        postLocation: PostLocation.all,
        postDate: DateTime(2024, 8, 25, 20, 0),
        contents: '롤 같이 할 사람 구합니다. 티어 무관, 즐겜 위주로 합니다.',
        numOfCurrentPeople: 2,
        numOfPeople: 5,
        numOfCurrentMale: 2,
        numOfMale: 4,
        numOfCurrentFemale: 0,
        numOfFemale: 1,
        ageFrom: 18,
        ageTo: 30,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: false,
        ageRestriction: true,
      ),
      PostModel(
        id: 202,
        postCategory: PostCategory.OTHERS,
        title: '[더미] 보드게임 모임',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024, 8, 18, 15, 0),
        contents: '주말에 보드게임 카페에서 보드게임 즐기실 분 모집합니다.',
        numOfCurrentPeople: 3,
        numOfPeople: 6,
        numOfCurrentMale: 1,
        numOfMale: 3,
        numOfCurrentFemale: 2,
        numOfFemale: 3,
        ageFrom: 25,
        ageTo: 35,
        genderRestriction: PostGenderRestriction.MIX,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      PostModel(
        id: 203,
        postCategory: PostCategory.HIRING,
        title: '[더미] 웹 디자이너 구합니다',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024, 8, 30, 14, 0),
        contents: '스타트업에서 함께 일할 웹 디자이너를 찾고 있습니다. 포트폴리오 지참 필수.',
        numOfCurrentPeople: 1,
        numOfPeople: 2,
        numOfCurrentMale: 1,
        numOfMale: 1,
        numOfCurrentFemale: 0,
        numOfFemale: 1,
        ageFrom: 25,
        ageTo: 40,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: true,
        ageRestriction: false,
      ),
    ];
  }

  @override
  Future<List<DmModel>> getDmList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      DmModel(
        id: 301,
        userModel: UserModel(
          id: 401,
          nickname: '더미사용자1',
          stateMsg: '더미 상태메시지입니다',
          profileUrl: 'dummy_profile_1',
          mannerTemperature: 36.5,
        ),
        latestMsg: "더미 메시지입니다. 안녕하세요!",
        latestTime: DateTime.now().subtract(const Duration(minutes: 10)),
        notReadMsg: 3,
      ),
      DmModel(
        id: 302,
        userModel: UserModel(
          id: 402,
          nickname: '더미사용자2',
          stateMsg: '더미 프로필 입니다',
          profileUrl: 'dummy_profile_2',
          mannerTemperature: 40.2,
        ),
        latestMsg: "더미 약속 시간에 늦지 않게 와주세요.",
        latestTime: DateTime.now().subtract(const Duration(hours: 1)),
        notReadMsg: 0,
      ),
      DmModel(
        id: 303,
        userModel: UserModel(
          id: 403,
          nickname: '더미사용자3',
          stateMsg: '더미 테스트 중',
          profileUrl: 'dummy_profile_3',
          mannerTemperature: 38.7,
        ),
        latestMsg: "더미 파일 공유드립니다.",
        latestTime: DateTime.now().subtract(const Duration(days: 1)),
        notReadMsg: 5,
      ),
      DmModel(
        id: 304,
        userModel: UserModel(
          id: 404,
          nickname: '더미사용자4',
          stateMsg: null,
          profileUrl: null,
          mannerTemperature: 42.0,
        ),
        latestMsg: "더미 공지사항입니다. 확인 부탁드립니다.",
        latestTime: DateTime.now().subtract(const Duration(days: 2)),
        notReadMsg: 1,
      ),
    ];
  }
}

DateTime _renderDeletingDate() =>
    DateTime(2025, DateTime.now().month, DateTime.now().day - 1).toLocal();
