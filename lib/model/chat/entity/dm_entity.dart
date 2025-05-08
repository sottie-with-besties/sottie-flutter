import 'package:sottie_flutter/model/user/entity/user_entity.dart';

final class DmEntity {
  final int id;

  /// DM을 주고받는 상대방의 정보
  final UserEntity userEntity;

  /// 최근 받은 DM 내용
  final String latestMsg;

  /// 최근 받은 DM 시각
  final DateTime latestTime;

  /// 읽지 않은 DM 수
  final int notReadMsg;

  DmEntity({
    required this.id,
    required this.userEntity,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });
}
