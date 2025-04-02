import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

part 'dm_dto.freezed.dart';

part 'dm_dto.g.dart';

@freezed
sealed class DmDTO with _$DmDTO {
  factory DmDTO({
    required int id,

    /// DM을 주고받는 상대방의 정보
    required UserDTO userDTO,

    /// 최근 받은 DM 내용
    required String latestMsg,

    /// 최근 받은 DM 시각
    required DateTime latestTime,

    /// 읽지 않은 DM 수
    required int notReadMsg,
  }) = _DmDTO;

  factory DmDTO.fromJson(Map<String, dynamic> json) => _$DmDTOFromJson(json);
}
