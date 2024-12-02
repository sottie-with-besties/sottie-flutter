import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_category.dart';

final class PostSetting {
  /// 포스트 제목
  String title;

  /// 포스트 내용
  String content;

  /// 포스트 카테고리(번개, 친목, 게임 등)
  SottieCategory gatheringCategory;

  /// 시간도 포함, non-null 타입으로 안됨
  DateTime? gatheringDate;

  /// 검색 스크린 전용, 검색할 날짜 범위
  DateTimeRange? dateTimeRange;

  /// 검색 스크린 전용, 검색할 시간 범위의 시작
  TimeOfDay? timeStart;

  /// 검색 스크린 전용, 검색할 시간 범위의 끝
  TimeOfDay? timeEnd;

  /// 지역
  int locationId;

  /// 참여자 수 2 ~ 10 명
  int peopleNum;

  /// 성비 제한 스위치 (NONE, MALE, FEMAIL)
  String genderRestriction;

  /// 성비 제한이 있을 경우의 남자 수
  int maleNum;

  /// 성비 제한이 있을 경우의 여자 수
  int femaleNum;

  /// 최소 나이대
  int ageFrom;

  /// 최대 나이대
  int ageTo;

  /// 나이 제한 여부
  bool ageRestriction;

  /// 사용자의 매너 온도 제한
  bool mannerRestriction;

  /// 내 친구만 포스트 참여 가능
  bool onlyMyFriends;

  PostSetting({
    this.title = '',
    this.content = '',
    this.gatheringCategory = SottieCategory.all,
    this.gatheringDate, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.dateTimeRange,
    this.timeStart,
    this.timeEnd,
    this.locationId = 0,
    this.peopleNum = 0,
    this.genderRestriction = 'NONE',
    this.maleNum = 1,
    this.femaleNum = 1,
    this.ageFrom = 1,
    this.ageTo = 1,
    this.ageRestriction = false,
    this.mannerRestriction = false,
    this.onlyMyFriends = false,
  });

  Map<String, dynamic> toJsonForMakePostSend() {
    final makePostData = {
      'title': title,
      'content': content,
      'gatheringCategory': gatheringCategory.name, // Enum 데이터
      'gatheringDate': gatheringDate?.toLocal().toString() ?? '',
      'locationId': locationId,
      'peopleNum': peopleNum,
      'genderRestriction': genderRestriction,
      'maleNum': maleNum,
      'femaleNum': femaleNum,
      'ageTo': ageTo,
      'ageFrom': ageFrom,
      'ageRestriction': ageRestriction,
      'mannerRestriction': mannerRestriction,
      'onlyMyFriends': onlyMyFriends,
    };

    return makePostData;
  }

  Map<String, dynamic> toJsonForSearchFiltering() {
    final searchFilteringData = {
      'title': title,
      'content': content,
      'gatheringCategory': gatheringCategory.name, // Enum 데이터
      'dateStart': dateTimeRange?.start.toLocal().toString() ?? '',
      'dateEnd': dateTimeRange?.end.toLocal().toString() ?? '',
      'timeStart': timeStart ?? '',
      'timeEnd': timeEnd ?? '',
      'locationId': locationId, // Enum 데이터
      'peopleNum': peopleNum,
      'genderRestriction': genderRestriction,
      'maleNum': maleNum,
      'femaleNum': femaleNum,
      'ageTo': ageTo,
      'ageFrom': ageFrom,
      'ageRestriction': ageRestriction,
      'mannerRestriction': mannerRestriction,
      'onlyMyFriends': onlyMyFriends,
    };

    return searchFilteringData;
  }
}
