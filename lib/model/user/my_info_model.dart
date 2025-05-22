import 'package:sottie_flutter/model/auth/auth_type.dart';

class MyInfoModel {
  /// ID
  int id;

  /// 실명
  String name;

  /// 이메일
  String email;

  /// 닉네임
  String nickName;

  /// 패스워드
  String password;

  /// 핸드폰 번호
  String phoneNumber;

  /// 성별
  String gender;

  /// 식별 번호
  String identifier;

  /// 생일
  String birthYear;

  /// 본인 인증 여부
  bool phoneAuthenticated;

  /// 상태 메세지
  String stateMessage;

  /// 프로필 Url
  String? profileUrl;

  /// 프로필 Path => 긍정적 캐시
  String? myProfilePath;

  /// 골드 -> 화폐 이름 임시 지정
  int gold;

  /// 매너 온도
  double mannerPoint;

  /// 로그아웃으로 초기화
  AuthType authType;

  MyInfoModel({
    this.id = 1,
    this.name = "김진표",
    this.email = 'kjp1234@naver.com',
    this.nickName = '김진표닉네임',
    this.password = '1234',
    this.phoneNumber = '1234',
    this.gender = 'MAIL',
    this.identifier = '123213',
    this.birthYear = "2000-05-27",
    this.phoneAuthenticated = false,
    this.stateMessage = "안녕하세요",
    this.profileUrl,
    this.myProfilePath,
    this.gold = 100,
    this.mannerPoint = 36.5,
    this.authType = AuthType.logout,
  });

  factory MyInfoModel.fromJson(Map<String, dynamic> json) {
    return MyInfoModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nickName: json['nickName'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      identifier: json['identifier'],
      birthYear: json['birthYear'],
      phoneAuthenticated: json['phoneAuthenticated'],
      stateMessage: json['stateMessage'],
      profileUrl: json['profileUrl'],
      myProfilePath: json['myProfilePath'],
      gold: json['gold'],
      mannerPoint: json['mannerPoint'],
      authType: AuthType.values.byName(json['authType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nickName': nickName,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'identifier': identifier,
      'birthYear': birthYear,
      'phoneAuthenticated': phoneAuthenticated,
      'stateMessage': stateMessage,
      'profileUrl': profileUrl,
      'myProfilePath': myProfilePath,
      'gold': gold,
      'mannerPoint': mannerPoint,
      'authType': authType!.name,
    };
  }
}
