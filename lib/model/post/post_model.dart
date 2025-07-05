import 'package:sottie_flutter/model/post/post_enum.dart';

final class PostModel {
  // 포스트 ID
  final int id;

  // 모임 카테고리
  final PostCategory postCategory;

  // 포스트 제목
  final String title;

  // 모임 장소
  final PostLocation postLocation;

  // 모임 날짜
  final DateTime postDate;

  // 포스트를 설명하는 구체적 내용
  final String contents;

  // 성비 제한이 없을 경우 currentPeopleNum, peopleNum
  // 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
  final int numOfCurrentPeople;
  final int numOfPeople;
  final int numOfCurrentMale;
  final int numOfMale;
  final int numOfCurrentFemale;
  final int numOfFemale;

  // 최소 나이대
  final int ageFrom;

  // 최대 나이대
  final int ageTo;

  // 성비 제한
  final PostGenderRestriction genderRestriction;

  // 매너 온도 일정 기준 이상
  final bool mannerRestriction;

  // 나이 제한
  final bool ageRestriction;

  PostModel({
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
    required this.genderRestriction,
    required this.mannerRestriction,
    required this.ageRestriction,
  });

  // JSON에서 PostModel 생성
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      postCategory: PostCategory.values.firstWhere(
        (e) => e.name == json['gatheringCategory'],
        orElse: () => PostCategory.ALL,
      ),
      title: json['title'] as String,
      postLocation: PostLocation.values.firstWhere(
        (e) => e.id == json['locationId'],
        orElse: () => PostLocation.all,
      ),
      postDate: DateTime.parse(json['gatheringDate'].toString()),
      contents: json['contents'] as String,
      numOfCurrentPeople: json['currentPeopleNum'] as int,
      numOfPeople: json['peopleNum'] as int,
      numOfCurrentMale: json['currentMaleNum'] as int,
      numOfMale: json['maleNum'] as int,
      numOfCurrentFemale: json['currentFemaleNum'] as int,
      numOfFemale: json['femaleNum'] as int,
      ageFrom: json['ageFrom'] as int,
      ageTo: json['ageTo'] as int,
      genderRestriction: PostGenderRestriction.values.firstWhere(
        (e) => e.name == json['genderRestriction'],
        orElse: () => PostGenderRestriction.NONE,
      ),
      mannerRestriction: json['mannerRestriction'] as bool,
      ageRestriction: json['ageRestriction'] as bool,
    );
  }

  // PostModel을 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gatheringCategory': postCategory.name,
      'title': title,
      'locationId': postLocation.id,
      'gatheringDate': postDate.toIso8601String(),
      'contents': contents,
      'currentPeopleNum': numOfCurrentPeople,
      'peopleNum': numOfPeople,
      'currentMaleNum': numOfCurrentMale,
      'maleNum': numOfMale,
      'currentFemaleNum': numOfCurrentFemale,
      'femaleNum': numOfFemale,
      'ageFrom': ageFrom,
      'ageTo': ageTo,
      'genderRestriction': genderRestriction.name,
      'mannerRestriction': mannerRestriction,
      'ageRestriction': ageRestriction,
    };
  }
}
