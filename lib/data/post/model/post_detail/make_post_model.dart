import 'package:image_picker/image_picker.dart';
import 'package:sottie_flutter/data/post/model/post_detail/age_range.dart';
import 'package:sottie_flutter/data/post/model/post_detail/category_sottie.dart';
import 'package:sottie_flutter/data/post/model/post_detail/gender_restrictions.dart';
import 'package:sottie_flutter/data/post/model/post_detail/location.dart';

final class MakePostModel {
  String id;
  String title;
  String content;
  List<XFile>? images; // 업로드할 이미지 최대 3장정도?
  List<CategorySottie> category; // 분류
  DateTime? date; // 시간도 포함, non-null 타입으로 안됨
  Location location; // 지역
  int numOfMember; // (최대) 참여자 수 제한
  GenderRestrictions gender; // 성별 제한
  bool genderRatio; // 성비 제한 없음 스위치
  int numOfMan; // 성별 제한이 있을 경우의 남자 수;
  int numOfWoman; // 성별 제한이 있을 경우의 여자 수;
  List<AgeRangeSottie> ageRange;
  double manner; // 사용자의 매너 점수, 매너 온도 제한
  bool startSameTime; // 인원이 한번에 모였을 때 시작?
  bool openParticipation; // 채팅방이 생성된 후에도 도중에 누군가 들어올 수 있음.
  bool onlyMyFriends; // 내 친구만 들어올 수 있음

  MakePostModel({
    this.id = '',
    this.title = '',
    this.content = '',
    this.images,
    this.category = const [],
    this.date, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.location = Location.seoul,
    this.numOfMember = 0, // 0 => 최대 참여자 수 상관 없음
    this.gender = GenderRestrictions.all, // all => 성별 상관 없음
    this.genderRatio = false,
    this.numOfMan = 0,
    this.numOfWoman = 0,
    this.ageRange = const [],
    this.manner = 0, // 0 => 매너 온도 상관 없음
    this.startSameTime = false,
    this.openParticipation = false,
    this.onlyMyFriends = false,
  });
}
