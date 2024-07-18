import 'package:sottie_flutter/domain/find/classification_entity/category.dart';
import 'package:sottie_flutter/domain/find/classification_entity/gender_restrictions.dart';
import 'package:sottie_flutter/domain/find/classification_entity/location.dart';

final class Classification {
  List<Category> category; // 분류
  DateTime? date; // 시간도 포함, non-null 타입으로 안됨
  Location location; // 지역
  GenderRestrictions gender; // 성별 제한
  int minNumOfMember; // 최소 참여자 수 제한
  int maxNumOfMember; // 최대 참여자 수 제한
  int minAge; // 최소 나이 제한
  int maxAge; // 최대 나이 제한
  double manner; // 사용자의 매너 점수, 매너 온도 제한
  bool startSameTime; // 인원이 한번에 모였을 때 시작?
  int startNumOfMember; // 몇명이 모였을 때 시작할 것인지? minAge <= n <= maxAge, startSameTime이 true일 때만.
  bool openParticipation; // 채팅방이 생성된 후에도 도중에 누군가 들어올 수 있음.
  bool onlyMyFriends; // 내 친구만 들어올 수 있음

  Classification({
    this.category = const [Category.others],
    this.date, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.location = Location.seoul,
    this.gender = GenderRestrictions.all, // all => 성별 상관 없음
    this.minNumOfMember = 0, // 0 => 최소 참여자 수 상관 없음
    this.maxNumOfMember = 0, // 0 => 최대 참여자 수 상관 없음
    this.minAge = 0, // 0 => 최소 나이 상관 없음
    this.maxAge = 0, // 0 => 최대 나이 상관 없음
    this.manner = 0, // 0 => 매너 온도 상관 없음
    this.startSameTime = false,
    this.startNumOfMember = 0, // 0 => startSameTime false일때, 기본값은 maxAge
    this.openParticipation = false,
    this.onlyMyFriends = false,
  });
}
