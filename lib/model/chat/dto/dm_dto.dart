import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/chat/entity/dm_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

part 'dm_dto.g.dart';

@JsonSerializable()
final class DmDTO {
  final int id;

  /// DM을 주고받는 상대방의 정보
  final UserDTO userDTO;

  /// 최근 받은 DM 내용
  final String latestMsg;

  /// 최근 받은 DM 시각
  final DateTime latestTime;

  /// 읽지 않은 DM 수
  final int notReadMsg;

  DmDTO({
    required this.id,
    required this.userDTO,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });

  factory DmDTO.fromJson(Map<String, dynamic> json) => _$DmDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DmDTOToJson(this);

  factory DmDTO.fromEntity(DmEntity entity) => _$DmDTOFromEntity(entity);

  DmEntity toEntity() => _$DmDTOToEntity(this);
}
