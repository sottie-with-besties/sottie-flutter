import 'package:image_picker/image_picker.dart';

final class MyInfo {
  String name;
  String email;
  String nickName;
  String password;
  String phoneNumber;
  Gender gender;
  String identifier;
  String birthYear;
  bool phoneAuthenticated;
  String stateMessage;
  XFile? profile;
  int gold;
  double mannerPoint;

  // Todo: 배포할 때 쯤 내 개인정보 코드 수정
  MyInfo({
    this.name = '김진표',
    this.email = 'kjp00552277@gmail.com',
    this.nickName = '나의 닉네임',
    this.password = '12343456778',
    this.phoneNumber = '01035361901',
    this.gender = Gender.male,
    this.identifier = '1315135123',
    this.birthYear = '2000년 5월 27일',
    this.phoneAuthenticated = false,
    this.stateMessage = '상태 메세지',
    this.profile,
    this.gold = 450,
    this.mannerPoint = 100.0,
  });

  toJsonForSignUpCheck() {
    return {
      'name': name,
      'email': email,
      'nickName': nickName,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender.name,
      'identifier': identifier,
      'birthYear': birthYear,
      'phoneAuthenticated': phoneAuthenticated,
    };
  }
}

enum Gender {
  male("남성"),
  female("여성");

  final String value;

  const Gender(this.value);
}
