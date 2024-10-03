import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_age_range.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_category.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_gender_restrictions.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_location.dart';

final class PostSetting {
  String title;
  String content;
  List<XFile>? images; // 업로드할 이미지 최대 3장정도?
  List<SottieCategory> category; // 분류
  DateTime? date; // 시간도 포함, non-null 타입으로 안됨
  DateTime? dateStart; // Search Screen Filtering
  DateTime? dateEnd; // Search Screen Filtering
  TimeOfDay? timeStart; // Search Screen Filtering
  TimeOfDay? timeEnd; // Search Screen Filtering
  SottieLocation location; // 지역
  int numOfMember; // (최대) 참여자 수 제한
  SottieGenderRestrictions gender; // 성별 제한
  bool genderRatio; // 성비 제한 없음 스위치
  int numOfMan; // 성별 제한이 있을 경우의 남자 수;
  int numOfWoman; // 성별 제한이 있을 경우의 여자 수;
  List<SottieAgeRange> ageRange;
  double manner; // 사용자의 매너 점수, 매너 온도 제한
  bool startSameTime; // 인원이 한번에 모였을 때 시작?
  bool openParticipation; // 채팅방이 생성된 후에도 도중에 누군가 들어올 수 있음.
  bool onlyMyFriends; // 내 친구만 들어올 수 있음

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
    this.numOfMember = 0, // 0 => 최대 참여자 수 상관 없음
    this.gender = SottieGenderRestrictions.all, // all => 성별 상관 없음
    this.genderRatio = false,
    this.numOfMan = 0,
    this.numOfWoman = 0,
    this.ageRange = const [],
    this.manner = 36.5, // 0 => 매너 온도 상관 없음
    this.startSameTime = false,
    this.openParticipation = false,
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
      'gender': gender.name, // Enum 데이터
      'genderRatio': genderRatio,
      'numOfMan': numOfMan,
      'numOfWoman': numOfWoman,
      'ageRange': convertAgeRangeToStringList(), // Enum 데이터
      'manner': manner,
      'startSameTime': startSameTime,
      'openParticipation': openParticipation,
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
      'gender': gender.name, // Enum 데이터
      'genderRatio': genderRatio,
      'numOfMan': numOfMan,
      'numOfWoman': numOfWoman,
      'ageRange': convertAgeRangeToStringList(), // Enum 데이터
      'manner': manner,
      'startSameTime': startSameTime,
      'openParticipation': openParticipation,
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
