import 'package:sottie_flutter/data/user/model/user_gender.dart';

final class SignUpModel {
  String? name;
  String? email;
  String? nickName;
  String? password;
  String? phoneNumber;
  UserGender? gender;
  String? identifier;
  String? birthYear;
  bool? phoneAuthenticated;

  SignUpModel({
    this.name,
    this.email,
    this.nickName,
    this.password,
    this.phoneNumber,
    this.gender,
    this.identifier,
    this.birthYear,
    this.phoneAuthenticated,
  });
}
