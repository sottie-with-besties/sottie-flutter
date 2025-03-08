import 'package:sottie_flutter/data/user/model/user_model.dart' show UserModel;

final class DmEntity {
  final int id;

  /// DM을 주고받는 상대방의 정보
  final UserModel userModel;

  /// 최근 받은 DM 내용
  final String latestMsg;

  /// 최근 받은 DM 시각
  final DateTime latestTime;

  /// 읽지 않은 DM 수
  final int notReadMsg;

  DmEntity({
    required this.id,
    required this.userModel,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });

  factory DmEntity.fromModel({required DmEntity model}) {
    return DmEntity(
      id: model.id,
      userModel: model.userModel,
      latestMsg: model.latestMsg,
      latestTime: model.latestTime,
      notReadMsg: model.notReadMsg,
    );
  }
}
