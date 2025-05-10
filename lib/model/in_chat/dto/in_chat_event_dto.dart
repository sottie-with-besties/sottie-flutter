import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

part 'in_chat_event_dto.g.dart';

@JsonSerializable()
class InChatEventListDTO {
  final String roomId;
  final List<UserDTO> userList;
  final List<InChatEventDTO> inChatEventList;

  InChatEventListDTO({
    required this.roomId,
    required this.userList,
    required this.inChatEventList,
  });

  factory InChatEventListDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatEventListDTOFromJson(json);

  Map<String, dynamic> toJson() => _$InChatEventListDTOToJson(this);

  factory InChatEventListDTO.fromEntity(InChatEventListEntity entity) =>
      _$InChatEventListDTOFromEntity(entity);

  InChatEventListEntity toEntity() => _$InChatEventListDTOToEntity(this);
}

@JsonSerializable()
class InChatEventDTO {
  final String eventId;
  final int userId;
  final String inChatEventType;
  final DateTime timeStamp;
  final String inChatEventStatus;
  final InChatDataDTO inChatData;

  InChatEventDTO({
    required this.eventId,
    required this.userId,
    required this.inChatEventType,
    required this.timeStamp,
    required this.inChatEventStatus,
    required this.inChatData,
  });

  factory InChatEventDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatEventDTOFromJson(json);

  Map<String, dynamic> toJson() => _$InChatEventDTOToJson(this);

  factory InChatEventDTO.fromEntity(InChatEventEntity entity) =>
      _$InChatEventDTOFromEntity(entity);

  InChatEventEntity toEntity() => _$InChatEventDTOToEntity(this);
}

@JsonSerializable()
class InChatDataDTO {
  final String dataId;
  final String inChatDataType;
  final String contents;

  InChatDataDTO({
    required this.dataId,
    required this.inChatDataType,
    required this.contents,
  });

  factory InChatDataDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$InChatDataDTOToJson(this);

  factory InChatDataDTO.fromEntity(InChatDataEntity entity) =>
      _$InChatDataDTOFromEntity(entity);

  InChatDataEntity toEntity() => _$InChatDataDTOToEntity(this);
}
