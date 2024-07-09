import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/category.dart';
import 'package:sottie_flutter/data/classification/model/gender_restrictions.dart';
import 'package:sottie_flutter/data/classification/model/location.dart';

class Classification {
  List<Category>? category;
  DateTime? date;
  TimeOfDay? time;
  Location? location;
  GenderRestrictions? gender;
  int? numOfMember;
  int? minAge;
  int? maxAge;
  double? manner;

  Classification({
    this.category = const [Category.others],
    this.date, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.time,
    this.location = Location.seoul,
    this.gender, // null => 성별 상관없음
    this.numOfMember, // null => 참여자 수 상관없음
    this.minAge, // null => 최소나이 상관없음
    this.maxAge, // null => 최대나이 상관없음
    this.manner, // null => 매너온도 상관없음
  });
}
