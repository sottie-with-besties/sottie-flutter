import 'package:sottie_flutter/data/classification/model/category.dart';
import 'package:sottie_flutter/data/classification/model/gender_restrictions.dart';
import 'package:sottie_flutter/data/classification/model/location.dart';

class Classification {
  List<Category> category;
  DateTime? date; // 시간도 포함, non-null 타입으로 안됨
  Location location;
  GenderRestrictions gender;
  int minNumOfMember;
  int maxNumOfMember;
  int minAge;
  int maxAge;
  double manner;

  Classification({
    this.category = const [Category.others],
    this.date, // date와 time은 null로 못받게 프론트에서 예외 처리
    this.location = Location.seoul,
    this.gender = GenderRestrictions.all, // null => 성별 상관없음
    this.minNumOfMember = 0, // 0 => 최소 참여자 수 상관없음
    this.maxNumOfMember = 0, // 0 => 최대 참여자 수 상관없음
    this.minAge = 0, // 0 => 최소나이 상관없음
    this.maxAge = 0, // 0 => 최대나이 상관없음
    this.manner = 0, // null => 매너온도 상관없음
  });
}
