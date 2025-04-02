import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

part 'in_chat_event_dto.freezed.dart';

part 'in_chat_event_dto.g.dart';

@freezed
sealed class InChatEventListDTO with _$InChatEventListDTO {
  factory InChatEventListDTO({
    required String roomId,

    required List<UserDTO> userList,

    required List<InChatEventDTO> inChatEventList,
  }) = _InChatEventListDTO;

  factory InChatEventListDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatEventListDTOFromJson(json);
}

@freezed
sealed class InChatEventDTO with _$InChatEventDTO {
  factory InChatEventDTO({
    required String eventId,

    required int userId,

    required String inChatEventType,

    required DateTime timeStamp,

    required String inChatEventStatus,

    required InChatDataDTO inChatData,
  }) = _InChatEventDTO;

  factory InChatEventDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatEventDTOFromJson(json);
}

@freezed
sealed class InChatDataDTO with _$InChatDataDTO {
  factory InChatDataDTO({
    required String dataId,

    required String inChatDataType,

    required String contents,
  }) = _InChatDataDTO;

  factory InChatDataDTO.fromJson(Map<String, dynamic> json) =>
      _$InChatDataDTOFromJson(json);
}
