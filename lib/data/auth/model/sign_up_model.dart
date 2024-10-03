import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/user/model/user_gender.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@unfreezed
class SignUpModel with _$SignUpModel {
  factory SignUpModel({
    String? name,
    String? email,
    String? nickName,
    String? password,
    String? phoneNumber,
    UserGender? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
