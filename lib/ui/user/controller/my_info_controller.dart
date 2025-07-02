import 'package:sottie_flutter/model/auth/auth_type.dart';
import 'package:sottie_flutter/model/user/my_info_model.dart';

sealed class MyInfoController {
  static late final MyInfoModel _myInfoModel;

  // ID 값 getter
  static int get id => _myInfoModel.id;

  // 실명 getter
  static String get name => _myInfoModel.name;

  // 이메일 getter
  static String get email => _myInfoModel.email;

  // 핸드폰 번호 getter
  static String get phoneNumber => _myInfoModel.phoneNumber;

  // 성별 getter
  static String get gender => _myInfoModel.gender;

  // 식별 번호 getter
  static String get identifier => _myInfoModel.identifier;

  // 생일 getter
  static String get birthYear => _myInfoModel.birthYear;

  // 본인 인증 여부 getter
  static bool get phoneAuthenticated => _myInfoModel.phoneAuthenticated;

  // 닉네임 getter
  static String get nickName => _myInfoModel.nickName;

  // 골드 getter
  static int get gold => _myInfoModel.gold;

  // 매너 온도 getter
  static double get mannerPoint => _myInfoModel.mannerPoint;

  // 인증 유형 getter
  static AuthType get authType => _myInfoModel.authType;

  // 상태 메세지 getter
  static String get stateMessage => _myInfoModel.stateMessage;

  // 프로필 URL getter
  static String? get profileUrl => _myInfoModel.profileUrl;

  // 프로필 Path getter
  static String? get myProfilePath => _myInfoModel.myProfilePath;

  static void initMyInfo({required Map<String, dynamic> json}) {
    _myInfoModel = MyInfoModel.fromJson(json);
  }

  static void changeGold({required int gold}) {
    final newGold = _myInfoModel.gold + gold;
    _myInfoModel.gold = newGold > 0 ? newGold : 0;
  }

  static void changeProfilePath({required String? path}) =>
      _myInfoModel.myProfilePath = path;

  static void changeProfileUrl({required String? url}) =>
      _myInfoModel.profileUrl = url;

  static void changeNickname({required String nickName}) =>
      _myInfoModel.nickName = nickName;

  static void changeStateMessage({required String stateMessage}) =>
      _myInfoModel.stateMessage = stateMessage;
}
