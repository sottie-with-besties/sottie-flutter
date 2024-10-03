import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/user/model/user_gender.dart';

part 'my_info_model.freezed.dart';
part 'my_info_model.g.dart';

@unfreezed
class MyInfoModel with _$MyInfoModel {
  factory MyInfoModel({
    @Default('김진표') String name,
    @Default('kjp00552277@gmail.com') String email,
    @Default('나의 닉네임') String nickName,
    @Default('12343456778') String password,
    @Default('01035361901') String phoneNumber,
    @Default(UserGender.male) UserGender gender,
    @Default('123123123') String identifier,
    @Default('2000년 5월 27일') String birthYear,
    @Default(false) bool phoneAuthenticated,
    String? stateMessage,
    String? profileUrl,
    String? myProfilePath,
    @Default(0) int gold,
    @Default(0) double mannerPoint,
  }) = _MyInfoModel;

  factory MyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoModelFromJson(json);
}
