import 'package:flutter/material.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';

final class PostOptionsSetting {
  // 포스트 제목
  String title;

  // 포스트 내용
  String contents;

  // 포스트 카테고리(번개, 친목, 게임 등)
  PostCategory gatheringCategory;

  // 시간도 포함, non-null 타입으로 안됨
  DateTime? gatheringDate;

  // 검색 스크린 전용, 검색할 날짜 범위
  DateTimeRange? dateTimeRange;

  // 검색 스크린 전용, 검색할 시간 범위의 시작
  TimeOfDay? timeStart;

  // 검색 스크린 전용, 검색할 시간 범위의 끝
  TimeOfDay? timeEnd;

  // 지역
  int locationId;

  // 참여자 수 2 ~ 10 명
  int peopleNum;

  // 성비 제한 여부
  PostGenderRestriction genderRestriction;

  // 성비 제한이 있을 경우의 남자 수
  int maleNum;

  // 성비 제한이 있을 경우의 여자 수
  int femaleNum;

  // 최소 나이대
  int ageFrom;

  // 최대 나이대
  int ageTo;

  // 나이 제한 여부
  bool ageRestriction;

  // 사용자의 매너 온도 제한
  bool mannerRestriction;

  PostOptionsSetting({
    this.title = '',
    this.contents = '',
    this.gatheringCategory = PostCategory.ALL,
    this.gatheringDate, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.dateTimeRange,
    this.timeStart,
    this.timeEnd,
    this.locationId = 0,
    this.peopleNum = 1,
    this.genderRestriction = PostGenderRestriction.NONE,
    this.maleNum = 0,
    this.femaleNum = 0,
    this.ageFrom = 0,
    this.ageTo = 0,
    this.ageRestriction = false,
    this.mannerRestriction = false,
  });

  Map<String, dynamic> toJsonForMakePostSend() {
    return {
      'gatheringCategory': gatheringCategory.name,
      'title': title,
      'locationId': locationId,
      'gatheringDate': gatheringDate?.toIso8601String() ?? '',
      'contents': contents,
      'peopleNum': peopleNum,
      'maleNum': maleNum,
      'femaleNum': femaleNum,
      'ageFrom': ageFrom * 10,
      'ageTo': ageTo * 10,
      'genderRestriction': genderRestriction.name,
      'mannerRestriction': mannerRestriction,
      'ageRestriction': ageRestriction,
      // 'onlyMyFriends': onlyMyFriends,
    };
  }

  Map<String, dynamic> toJsonForSearchFiltering() {
    final searchFilteringData = {
      'title': title,
      'content': contents,
      'gatheringCategory': gatheringCategory.koreanName, // Enum 데이터
      'dateStart': dateTimeRange?.start.toLocal().toString() ?? '',
      'dateEnd': dateTimeRange?.end.toLocal().toString() ?? '',
      'timeStart': timeStart ?? '',
      'timeEnd': timeEnd ?? '',
      'locationId': locationId, // Enum 데이터
      'peopleNum': peopleNum,
      'genderRestriction': genderRestriction,
      'maleNum': maleNum,
      'femaleNum': femaleNum,
      'ageTo': ageTo * 10,
      'ageFrom': ageFrom * 10,
      'ageRestriction': ageRestriction,
      'mannerRestriction': mannerRestriction,
    };

    return searchFilteringData;
  }
}

PostOptionsSetting postOptionsSetting = PostOptionsSetting();
