import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/interface/post_repository.dart';

final class PostRepoImplDummy implements PostRepository {
  @override
  Future<List<PostModel>> getLatestPostModelList({
    required int lastPostId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      PostModel(
        id: lastPostId - 1,
        postCategory: PostCategory.THUNDER,
        title: '[더미] 주말 번개 모임',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024, 8, 15, 18, 0),
        contents: '더미 데이터: 주말에 강남에서 번개 모임을 갖고 싶습니다. 간단한 식사와 함께 대화를 나눠요.',
        numOfCurrentPeople: 3,
        numOfPeople: 6,
        numOfCurrentMale: 2,
        numOfMale: 3,
        numOfCurrentFemale: 1,
        numOfFemale: 3,
        ageFrom: 25,
        ageTo: 35,
        genderRestriction: PostGenderRestriction.MIX,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      PostModel(
        id: lastPostId - 2,
        postCategory: PostCategory.STUDY,
        title: '[더미] 코딩 스터디 모집',
        postLocation: PostLocation.suwon,
        postDate: DateTime(2024, 8, 20, 14, 0),
        contents: '더미 데이터: 플러터 공부를 함께할 스터디원을 모집합니다. 주 1회 오프라인으로 만나 스터디를 진행합니다.',
        numOfCurrentPeople: 2,
        numOfPeople: 5,
        numOfCurrentMale: 2,
        numOfMale: 3,
        numOfCurrentFemale: 0,
        numOfFemale: 2,
        ageFrom: 20,
        ageTo: 40,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: false,
        ageRestriction: false,
      ),
      PostModel(
        id: lastPostId - 3,
        postCategory: PostCategory.EXERCISE,
        title: '[더미] 주말 축구 인원 모집',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024, 8, 18, 10, 0),
        contents: '더미 데이터: 주말 아침에 축구할 인원을 모집합니다. 장소는 잠실종합운동장입니다.',
        numOfCurrentPeople: 7,
        numOfPeople: 10,
        numOfCurrentMale: 7,
        numOfMale: 10,
        numOfCurrentFemale: 0,
        numOfFemale: 0,
        ageFrom: 20,
        ageTo: 40,
        genderRestriction: PostGenderRestriction.MALE,
        mannerRestriction: true,
        ageRestriction: true,
      ),
      PostModel(
        id: lastPostId - 4,
        postCategory: PostCategory.HIRING,
        title: '[더미] 스타트업 개발자 구인',
        postLocation: PostLocation.all,
        postDate: DateTime(2024, 9, 1, 9, 0),
        contents: '더미 데이터: 플러터 개발자를 구인합니다. 경력 무관, 열정 있는 개발자를 찾습니다.',
        numOfCurrentPeople: 1,
        numOfPeople: 2,
        numOfCurrentMale: 1,
        numOfMale: 1,
        numOfCurrentFemale: 0,
        numOfFemale: 1,
        ageFrom: 25,
        ageTo: 45,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: false,
        ageRestriction: false,
      ),
    ];
  }

  @override
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500), null);

    // 검색 설정에 따라 필터링하는 것처럼 보이게 하기
    // final category = searchSetting['category'];
    // final location = searchSetting['location'];

    List<PostModel> results = [
      PostModel(
        id: 101,
        postCategory: PostCategory.GAME,
        title: '[더미 검색] 온라인 게임 모임',
        postLocation: PostLocation.all,
        postDate: DateTime(2024, 8, 25, 20, 0),
        contents: '더미 검색 데이터: 온라인으로 게임할 분들을 모집합니다.',
        numOfCurrentPeople: 3,
        numOfPeople: 5,
        numOfCurrentMale: 2,
        numOfMale: 3,
        numOfCurrentFemale: 1,
        numOfFemale: 2,
        ageFrom: 18,
        ageTo: 35,
        genderRestriction: PostGenderRestriction.NONE,
        mannerRestriction: false,
        ageRestriction: true,
      ),
      PostModel(
        id: 102,
        postCategory: PostCategory.FRIENDSHIP,
        title: '[더미 검색] 맛집 탐방',
        postLocation: PostLocation.seoul,
        postDate: DateTime(2024, 8, 22, 18, 30),
        contents: '더미 검색 데이터: 서울 맛집 탐방하실 분들 모집합니다.',
        numOfCurrentPeople: 4,
        numOfPeople: 6,
        numOfCurrentMale: 2,
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
        id: 103,
        postCategory: PostCategory.STUDY,
        title: '[더미 검색] 토익 스터디',
        postLocation: PostLocation.suwon,
        postDate: DateTime(2024, 9, 5, 19, 0),
        contents: '더미 검색 데이터: 토익 공부를 함께할 스터디원을 모집합니다.',
        numOfCurrentPeople: 2,
        numOfPeople: 4,
        numOfCurrentMale: 1,
        numOfMale: 2,
        numOfCurrentFemale: 1,
        numOfFemale: 2,
        ageFrom: 20,
        ageTo: 30,
        genderRestriction: PostGenderRestriction.MIX,
        mannerRestriction: false,
        ageRestriction: true,
      ),
    ];

    return results;
  }

  @override
  Future<void> makePost({required Map<String, dynamic> postSetting}) async {
    await Future.delayed(const Duration(milliseconds: 700), null);
  }

  @override
  Future<void> postJoin({required Map<String, dynamic> postJoinInfo}) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
  }

  @override
  Future<void> postExit() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
  }
}
