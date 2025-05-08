import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/common/dto_interface.dart';

import '../entity/post_detail_enum/post_category.dart';
import '../entity/post_detail_enum/post_gender_restriction.dart';
import '../entity/post_detail_enum/post_location.dart';
import '../entity/post_entity.dart';

part 'post_dto.g.dart';

@JsonSerializable()
final class PostDTO implements DTO {
  /// 포스트 ID
  final int id;

  /// 모임 카테고리
  final String gatheringCategory;

  /// 포스트 제목
  final String title;

  /// 모임 장소
  final int locationId;

  /// 모임 날짜
  final DateTime gatheringDate;

  /// 포스트를 설명하는 구체적 내용
  final String contents;

  /// 성비 제한이 없을 경우 currentPeopleNum, peopleNum
  /// 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
  final int currentPeopleNum;
  final int peopleNum;
  final int currentMaleNum;
  final int maleNum;
  final int currentFemaleNum;
  final int femaleNum;

  /// 최소 나이대
  final int ageFrom;

  /// 최대 나이대
  final int ageTo;

  /// 성비 제한
  final String genderRestriction;

  /// 매너 온도 일정 기준 이상
  final bool mannerRestriction;

  /// 나이 제한
  final bool ageRestriction;

  PostDTO({
    required this.id,
    required this.gatheringCategory,
    required this.title,
    required this.locationId,
    required this.gatheringDate,
    required this.contents,
    required this.currentPeopleNum,
    required this.peopleNum,
    required this.currentMaleNum,
    required this.maleNum,
    required this.currentFemaleNum,
    required this.femaleNum,
    required this.ageFrom,
    required this.ageTo,
    required this.genderRestriction,
    required this.mannerRestriction,
    required this.ageRestriction,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostDTOToJson(this);

  factory PostDTO.fromEntity({required PostEntity entity}) {
    return PostDTO(
      id: entity.id,
      gatheringCategory: entity.postCategory.name,
      title: entity.title,
      locationId: entity.postLocation.index,
      gatheringDate: entity.postDate,
      contents: entity.contents,
      currentPeopleNum: entity.numOfCurrentPeople,
      peopleNum: entity.numOfPeople,
      currentMaleNum: entity.numOfCurrentMale,
      maleNum: entity.numOfMale,
      currentFemaleNum: entity.numOfCurrentFemale,
      femaleNum: entity.numOfFemale,
      ageFrom: entity.ageFrom,
      ageTo: entity.ageTo,
      genderRestriction: entity.genderRestriction.name,
      mannerRestriction: entity.mannerRestriction,
      ageRestriction: entity.ageRestriction,
    );
  }

  @override
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      postCategory: PostCategory.values.byName(gatheringCategory),
      title: title,
      postLocation: PostLocation.values[locationId],
      postDate: gatheringDate.toLocal(),
      contents: contents,
      numOfCurrentPeople: currentPeopleNum,
      numOfPeople: peopleNum,
      numOfCurrentMale: currentMaleNum,
      numOfMale: maleNum,
      numOfCurrentFemale: currentFemaleNum,
      numOfFemale: femaleNum,
      ageFrom: ageFrom,
      ageTo: ageTo,
      genderRestriction: PostGenderRestriction.values.byName(genderRestriction),
      mannerRestriction: mannerRestriction,
      ageRestriction: ageRestriction,
    );
  }
}
