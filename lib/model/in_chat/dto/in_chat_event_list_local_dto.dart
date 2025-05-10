import 'package:objectbox/objectbox.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_local_dto.dart';

@Entity()
final class InChatEventListLocalDTO {
  @Id()
  int id = 0;

  final String roomId;

  final userList = ToMany<UserLocalDTO>();

  final inChatEventList = ToMany<InChatEventLocalDTO>();

  InChatEventListLocalDTO({required this.roomId});

  factory InChatEventListLocalDTO.fromEntity(InChatEventListEntity entity) {
    final roomId = entity.roomId;
    final userList =
        entity.userList.map((e) => UserLocalDTO.fromEntity(e)).toList();
    final inChatEventList =
        entity.inChatEventList.map((e) {
          final inChatDataLocalDTO = InChatDataLocalDTO.fromEntity(
            e.inChatData,
          );
          final inChatEventLocalDTO = InChatEventLocalDTO.fromEntity(e)
            ..setInChatData(inChatDataLocalDTO);
          return inChatEventLocalDTO;
        }).toList();

    final inChatEventListLocalDTO = InChatEventListLocalDTO(roomId: roomId)
      ..setLists(userList: userList, inChatEventList: inChatEventList);

    return inChatEventListLocalDTO;
  }

  void setLists({
    required List<UserLocalDTO> userList,
    required List<InChatEventLocalDTO> inChatEventList,
  }) {
    this.userList.addAll(userList);
    this.inChatEventList.addAll(inChatEventList);
  }

  InChatEventListEntity toEntity() {
    final userEntityList = userList.map((user) => user.toEntity()).toList();
    final eventEntityList =
        inChatEventList.map((event) => event.toEntity()).toList();

    return InChatEventListEntity(
      roomId: roomId,
      userList: userEntityList,
      inChatEventList: eventEntityList,
    );
  }
}

@Entity()
final class InChatEventLocalDTO {
  @Id()
  int id = 0;

  final int eventId;

  final String userId;

  final String inChatEventType;

  @Property(type: PropertyType.date)
  final DateTime timeStamp;

  final String inChatEventStatus;

  final inChatData = ToOne<InChatDataLocalDTO>();

  InChatEventLocalDTO({
    required this.eventId,
    required this.userId,
    required this.inChatEventType,
    required this.timeStamp,
    required this.inChatEventStatus,
  });

  factory InChatEventLocalDTO.fromEntity(InChatEventEntity entity) {
    return InChatEventLocalDTO(
      eventId: entity.eventId,
      userId: entity.userId,
      inChatEventType: entity.inChatEventType.name,
      timeStamp: entity.timeStamp,
      inChatEventStatus: entity.inChatEventStatus.name,
    );
  }

  void setInChatData(InChatDataLocalDTO inChatData) {
    this.inChatData.target = inChatData;
  }

  InChatEventEntity toEntity() {
    return InChatEventEntity(
      eventId: eventId,
      userId: userId,
      inChatEventType: InChatEventType.values.byName(inChatEventType),
      timeStamp: timeStamp,
      inChatEventStatus: InChatEventStatus.values.byName(inChatEventStatus),
      inChatData:
          inChatData.target?.toEntity() ??
          // Fallback empty data entity in case the relation is null
          const InChatDataEntity(
            dataId: '',
            inChatDataType: InChatDataType.TEXT,
            contents: '',
          ),
    );
  }
}

@Entity()
final class InChatDataLocalDTO {
  @Id()
  int id = 0;

  final String dataId;

  final String inChatDataType;

  final String contents;

  InChatDataLocalDTO({
    required this.dataId,
    required this.inChatDataType,
    required this.contents,
  });

  factory InChatDataLocalDTO.fromEntity(InChatDataEntity entity) {
    return InChatDataLocalDTO(
      dataId: entity.dataId,
      inChatDataType: entity.inChatDataType.name,
      contents: entity.contents,
    );
  }

  InChatDataEntity toEntity() {
    return InChatDataEntity(
      dataId: dataId,
      inChatDataType: InChatDataType.values.byName(inChatDataType),
      contents: contents,
    );
  }
}
