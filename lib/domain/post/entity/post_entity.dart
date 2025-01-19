import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_category.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_gender_restriction.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_location.dart';

final class PostEntity {
  /// 포스트 ID
  final int id;

  /// 모임 카테고리
  final PostCategory postCategory;

  /// 포스트 제목
  final String title;

  /// 모임 장소
  final PostLocation postLocation;

  /// 모임 날짜
  final DateTime postDate;

  /// 포스트를 설명하는 구체적 내용
  final String contents;

  /// 성비 제한이 없을 경우 currentPeopleNum, peopleNum
  /// 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
  final int numOfCurrentPeople;
  final int numOfPeople;
  final int numOfCurrentMale;
  final int numOfMale;
  final int numOfCurrentFemale;
  final int numOfFemale;

  /// 최소 나이대
  final int ageFrom;

  /// 최대 나이대
  final int ageTo;

  /// 내 친구만 입장 가능 여부
  final bool onlyMyFriends;

  /// 성비 제한
  final PostGenderRestriction genderRestriction;

  /// 매너 온도 일정 기준 이상
  final bool mannerRestriction;

  /// 나이 제한
  final bool ageRestriction;

  PostEntity({
    required this.id,
    required this.postCategory,
    required this.title,
    required this.postLocation,
    required this.postDate,
    required this.contents,
    required this.numOfCurrentPeople,
    required this.numOfPeople,
    required this.numOfCurrentMale,
    required this.numOfMale,
    required this.numOfCurrentFemale,
    required this.numOfFemale,
    required this.ageFrom,
    required this.ageTo,
    required this.onlyMyFriends,
    required this.genderRestriction,
    required this.mannerRestriction,
    required this.ageRestriction,
  });

  factory PostEntity.fromModel({required PostModel model}) {
    return PostEntity(
      id: model.id,
      postCategory: PostCategory.values.byName(model.gatheringCategory),
      title: model.title,
      postLocation: PostLocation.values[model.locationId],
      postDate: model.gatheringDate.toLocal(),
      contents: model.contents,
      numOfCurrentPeople: model.currentPeopleNum,
      numOfPeople: model.peopleNum,
      numOfCurrentMale: model.currentMaleNum,
      numOfMale: model.maleNum,
      numOfCurrentFemale: model.currentFemaleNum,
      numOfFemale: model.femaleNum,
      ageFrom: model.ageFrom,
      ageTo: model.ageTo,
      onlyMyFriends: model.onlyMyFriends,
      genderRestriction:
          PostGenderRestriction.values.byName(model.genderRestriction),
      mannerRestriction: model.mannerRestriction,
      ageRestriction: model.ageRestriction,
    );
  }
}
