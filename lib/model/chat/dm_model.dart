import 'package:sottie_flutter/model/user/user_model.dart';

final class DmModel {
  final int id;

  // DM을 주고받는 상대방의 정보
  final UserModel userModel;

  // 최근 받은 DM 내용
  final String latestMsg;

  // 최근 받은 DM 시각
  final DateTime latestTime;

  // 읽지 않은 DM 수
  final int notReadMsg;

  DmModel({
    required this.id,
    required this.userModel,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });

  factory DmModel.fromJson(Map<String, dynamic> json) {
    return DmModel(
      id: json['id'],
      userModel: UserModel.fromJson(json['userEntity']),
      latestMsg: json['latestMsg'],
      latestTime: DateTime.parse(json['latestTime']),
      notReadMsg: json['notReadMsg'],
    );
  }
}
