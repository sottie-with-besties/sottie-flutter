import 'package:sottie_flutter/model/auth/auth_type.dart';

class MyInfoModel {
  // ID
  final int id;

  // 실명
  final String name;

  // 이메일
  final String email;

  // 핸드폰 번호
  final String phoneNumber;

  // 성별
  final String gender;

  // 식별 번호
  final String identifier;

  // 생일
  final String birthYear;

  // 본인 인증 여부
  final bool phoneAuthenticated;

  // 닉네임
  String nickName;

  // 골드 -> 화폐 이름 임시 지정
  int gold;

  // 매너 온도
  double mannerPoint;

  // 로그아웃으로 초기화
  AuthType authType;

  // 상태 메세지
  String stateMessage;

  // 프로필 Url
  String? profileUrl;

  // 프로필 Path => 긍정적 캐시
  String? myProfilePath;

  MyInfoModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.identifier,
    required this.birthYear,
    required this.phoneAuthenticated,
    this.nickName = '김진표닉네임',
    this.gold = 0,
    this.mannerPoint = 36.5,
    this.authType = AuthType.logout,
    this.stateMessage = "",
    this.profileUrl,
    this.myProfilePath,
  });

  factory MyInfoModel.fromJson(Map<String, dynamic> json) {
    return MyInfoModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nickName: json['nickName'],
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
      'authType': authType.name,
    };
  }
}
