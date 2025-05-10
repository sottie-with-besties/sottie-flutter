// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_chat_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InChatEventListDTO _$InChatEventListDTOFromJson(Map<String, dynamic> json) =>
    InChatEventListDTO(
      roomId: json['roomId'] as String,
      userList:
          (json['userList'] as List<dynamic>)
              .map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      inChatEventList:
          (json['inChatEventList'] as List<dynamic>)
              .map((e) => InChatEventDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$InChatEventListDTOToJson(InChatEventListDTO instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'userList': instance.userList,
      'inChatEventList': instance.inChatEventList,
    };

InChatEventDTO _$InChatEventDTOFromJson(Map<String, dynamic> json) =>
    InChatEventDTO(
      eventId: json['eventId'] as String,
      userId: (json['userId'] as num).toInt(),
      inChatEventType: json['inChatEventType'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      inChatEventStatus: json['inChatEventStatus'] as String,
      inChatData: InChatDataDTO.fromJson(
        json['inChatData'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InChatEventDTOToJson(InChatEventDTO instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'userId': instance.userId,
      'inChatEventType': instance.inChatEventType,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'inChatEventStatus': instance.inChatEventStatus,
      'inChatData': instance.inChatData,
    };

InChatDataDTO _$InChatDataDTOFromJson(Map<String, dynamic> json) =>
    InChatDataDTO(
      dataId: json['dataId'] as String,
      inChatDataType: json['inChatDataType'] as String,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$InChatDataDTOToJson(InChatDataDTO instance) =>
    <String, dynamic>{
      'dataId': instance.dataId,
      'inChatDataType': instance.inChatDataType,
      'contents': instance.contents,
    };

InChatEventListDTO _$InChatEventListDTOFromEntity(
  InChatEventListEntity entity,
) => InChatEventListDTO(
  roomId: entity.roomId,
  userList: entity.userList.map((user) => UserDTO.fromEntity(user)).toList(),
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

InChatEventListEntity _$InChatEventListDTOToEntity(
  InChatEventListDTO instance,
) => InChatEventListEntity(
  roomId: instance.roomId,
  userList: instance.userList.map((userDTO) => userDTO.toEntity()).toList(),
  inChatEventList:
      instance.inChatEventList.map((eventDTO) => eventDTO.toEntity()).toList(),
);

InChatEventDTO _$InChatEventDTOFromEntity(InChatEventEntity entity) =>
    InChatEventDTO(
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

InChatEventEntity _$InChatEventDTOToEntity(InChatEventDTO instance) =>
    InChatEventEntity(
      eventId: int.parse(instance.eventId),
      userId: instance.userId.toString(),
      inChatEventType: InChatEventType.values.byName(instance.inChatEventType),
      timeStamp: instance.timeStamp.toLocal(),
      inChatEventStatus: InChatEventStatus.values.byName(
        instance.inChatEventStatus,
      ),
      inChatData: instance.inChatData.toEntity(),
    );

InChatDataDTO _$InChatDataDTOFromEntity(InChatDataEntity entity) =>
    InChatDataDTO(
      dataId: entity.dataId,
      inChatDataType: entity.inChatDataType.name,
      contents: entity.contents,
    );

InChatDataEntity _$InChatDataDTOToEntity(InChatDataDTO instance) =>
    InChatDataEntity(
      dataId: instance.dataId,
      inChatDataType: InChatDataType.values.byName(instance.inChatDataType),
      contents: instance.contents,
    );
