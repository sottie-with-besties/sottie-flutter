import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_age_range.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_category.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_location.dart';

final class PostSetting {
  /// 포스트 제목
  String title;

  /// 포스트 내용
  String content;

  /// 업로드 할 썸네일 이미지 최대 3장
  List<XFile>? images;

  /// 포스트 카테고리(번개, 친목, 게임 등)
  List<SottieCategory> category;

  /// 시간도 포함, non-null 타입으로 안됨
  DateTime? date;

  /// 검색 스크린 전용, 검색할 날짜 범위의 시작
  DateTime? dateStart;

  /// 검색 스크린 전용, 검색할 날짜 범위의 끝
  DateTime? dateEnd;

  /// 검색 스크린 전용, 검색할 시간 범위의 시작
  TimeOfDay? timeStart;

  /// 검색 스크린 전용, 검색할 시간 범위의 끝
  TimeOfDay? timeEnd;

  /// 지역
  SottieLocation location;

  /// 참여자 수 2 ~ 10 명
  int numOfMember;

  /// 성비 제한 스위치
  bool genderRatio;

  /// 성비 제한이 있을 경우의 남자 수
  int numOfMan;

  /// 성비 제한이 있을 경우의 여자 수
  int numOfWoman;

  /// 나이 범위(10대, 20대, 30대 등)
  List<SottieAgeRange> ageRange;

  /// 사용자의 매너 온도 제한
  double mannerPoint;

  /// 설정된 인원 수가 모이면 채팅 시작
  bool startSameTime;

  /// 내 친구만 포스트 참여 가능
  bool onlyMyFriends;

  PostSetting({
    this.title = '',
    this.content = '',
    this.images,
    this.category = const [],
    this.date, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.dateStart,
    this.dateEnd,
    this.timeStart,
    this.timeEnd,
    this.location = SottieLocation.all,
    this.numOfMember = 2,
    this.genderRatio = false,
    this.numOfMan = 0,
    this.numOfWoman = 0,
    this.ageRange = const [],
    this.mannerPoint = 36.5, // 0 => 매너 온도 상관 없음
    this.startSameTime = false,
    this.onlyMyFriends = false,
  });

  Map<String, dynamic> toJsonForMakePostSend() {
    List? images;
    if (this.images != null) {
      images = this.images!.map((img) {
        return MultipartFile.fromFileSync(img.path,
            contentType: DioMediaType('image', 'jpg'));
      }).toList();
    }

    final makePostData = {
      'title': title,
      'content': content,
      'images': images ?? [],
      'category': convertCategoryToStringList(), // Enum 데이터
      'date': date ?? '',
      'location': location.toString(), // Enum 데이터
      'numOfMember': numOfMember,
      'genderRatio': genderRatio,
      'numOfMan': numOfMan,
      'numOfWoman': numOfWoman,
      'ageRange': convertAgeRangeToStringList(), // Enum 데이터
      'manner': mannerPoint,
      'startSameTime': startSameTime,
      'onlyMyFriends': onlyMyFriends,
    };

    return makePostData;
  }

  Map<String, dynamic> toJsonForSearchFiltering() {
    final searchFilteringData = {
      'title': title,
      'content': content,
      'category': convertCategoryToStringList(), // Enum 데이터
      'dateStart': dateStart ?? '',
      'dateEnd': dateEnd ?? '',
      'timeStart': timeStart ?? '',
      'timeEnd': timeEnd ?? '',
      'location': location.toString(), // Enum 데이터
      'numOfMember': numOfMember,
      'genderRatio': genderRatio,
      'numOfMan': numOfMan,
      'numOfWoman': numOfWoman,
      'ageRange': convertAgeRangeToStringList(), // Enum 데이터
      'manner': mannerPoint,
      'startSameTime': startSameTime,
      'onlyMyFriends': onlyMyFriends,
    };

    return searchFilteringData;
  }

  List<String> convertCategoryToStringList() {
    List<String> result = <String>[];
    for (SottieCategory i in category) {
      result.add(i.name);
    }
    return result;
  }

  List<String> convertAgeRangeToStringList() {
    List<String> result = <String>[];
    for (SottieAgeRange i in ageRange) {
      result.add(i.name);
    }
    return result;
  }
}
