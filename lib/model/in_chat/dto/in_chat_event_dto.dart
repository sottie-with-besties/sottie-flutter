import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/common/dto_interface.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';

part 'in_chat_event_dto.g.dart';

@JsonSerializable()
class InChatEventListDTO implements DTO {
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

  factory InChatEventListDTO.fromEntity({
    required InChatEventListEntity entity,
  }) {
    return InChatEventListDTO(
      roomId: entity.roomId,
      userList:
          entity.userList
              .map(
                (user) => UserDTO(
                  id: user.id,
                  nickname: user.nickname,
                  stateMsg: user.stateMsg,
                  profileUrl: user.profileUrl,
                  mannerTemperature: user.mannerTemperature,
                ),
              )
              .toList(),
      inChatEventList:
          entity.inChatEventList
              .map(
                (event) => InChatEventDTO(
                  eventId: event.eventId.toString(),
                  userId: int.parse(event.userId),
                  inChatEventType: event.inChatEventType.name,
                  timeStamp: event.timeStamp,
                  inChatEventStatus: event.inChatEventStatus.name,
                  inChatData: InChatDataDTO(
                    dataId: event.inChatData.dataId,
                    inChatDataType: event.inChatData.inChatDataType.name,
                    contents: event.inChatData.contents,
                  ),
                ),
              )
              .toList(),
    );
  }

  @override
  InChatEventListEntity toEntity() {
    return InChatEventListEntity(
      roomId: roomId,
      userList: userList.map((userDTO) => userDTO.toEntity()).toList(),
      inChatEventList:
          inChatEventList.map((eventDTO) => eventDTO.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class InChatEventDTO implements DTO {
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

  factory InChatEventDTO.fromEntity({required InChatEventEntity entity}) {
    return InChatEventDTO(
      eventId: entity.eventId.toString(),
      userId: int.parse(entity.userId),
      inChatEventType: entity.inChatEventType.name,
      timeStamp: entity.timeStamp,
      inChatEventStatus: entity.inChatEventStatus.name,
      inChatData: InChatDataDTO(
        dataId: entity.inChatData.dataId,
        inChatDataType: entity.inChatData.inChatDataType.name,
        contents: entity.inChatData.contents,
      ),
    );
  }

  @override
  InChatEventEntity toEntity() {
    return InChatEventEntity(
      eventId: int.parse(eventId),
      userId: userId.toString(),
      inChatEventType: InChatEventType.values.byName(inChatEventType),
      timeStamp: timeStamp.toLocal(),
      inChatEventStatus: InChatEventStatus.values.byName(inChatEventStatus),
      inChatData: inChatData.toEntity(),
    );
  }
}

@JsonSerializable()
class InChatDataDTO implements DTO {
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

  factory InChatDataDTO.fromEntity({required InChatDataEntity entity}) {
    return InChatDataDTO(
      dataId: entity.dataId,
      inChatDataType: entity.inChatDataType.name,
      contents: entity.contents,
    );
  }

  @override
  InChatDataEntity toEntity() {
    return InChatDataEntity(
      dataId: dataId,
      inChatDataType: InChatDataType.values.byName(inChatDataType),
      contents: contents,
    );
  }
}
