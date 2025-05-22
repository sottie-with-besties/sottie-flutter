import 'package:objectbox/objectbox.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/model/user/user_local_model.dart';

@Entity()
final class InChatEventListLocalModel {
  @Id()
  int id = 0;

  final String roomId;

  final userList = ToMany<UserLocalModel>();

  final inChatEventList = ToMany<InChatEventLocalModel>();

  InChatEventListLocalModel({required this.roomId});

  factory InChatEventListLocalModel.fromModel(InChatEventListModel model) {
    final roomId = model.roomId;
    final userList =
        model.userList.map((e) => UserLocalModel.fromModel(e)).toList();
    final inChatEventList =
        model.inChatEventList.map((e) {
          final inChatEventLocalDTO = InChatEventLocalModel.fromModel(e);
          return inChatEventLocalDTO;
        }).toList();

    final inChatEventListLocalDTO = InChatEventListLocalModel(roomId: roomId)
      ..setLists(userList: userList, inChatEventList: inChatEventList);

    return inChatEventListLocalDTO;
  }

  void setLists({
    required List<UserLocalModel> userList,
    required List<InChatEventLocalModel> inChatEventList,
  }) {
    this.userList.addAll(userList);
    this.inChatEventList.addAll(inChatEventList);
  }

  InChatEventListModel toModel() {
    final userModelList = userList.map((user) => user.toModel()).toList();
    final eventModelList =
        inChatEventList.map((event) => event.toModel()).toList();

    return InChatEventListModel(
      roomId: roomId,
      userList: userModelList,
      inChatEventList: eventModelList,
    );
  }
}

@Entity()
final class InChatEventLocalModel {
  @Id()
  int id = 0;

  final int eventId;

  final String userId;

  final String inChatEventType;

  @Property(type: PropertyType.date)
  final DateTime timeStamp;

  final String inChatEventStatus;

  final String inChatDataType;

  final String contents;

  InChatEventLocalModel({
    required this.eventId,
    required this.userId,
    required this.inChatEventType,
    required this.timeStamp,
    required this.inChatEventStatus,
    required this.inChatDataType,
    required this.contents,
  });

  factory InChatEventLocalModel.fromModel(InChatEventModel model) {
    return InChatEventLocalModel(
      eventId: model.eventId,
      userId: model.userId,
      inChatEventType: model.inChatEventType.name,
      timeStamp: model.timeStamp,
      inChatEventStatus: model.inChatEventStatus.name,
      inChatDataType: model.inChatDataType.name,
      contents: model.contents,
    );
  }

  InChatEventModel toModel() {
    return InChatEventModel(
      eventId: eventId,
      userId: userId,
      inChatEventType: InChatEventType.values.byName(inChatEventType),
      timeStamp: timeStamp,
      inChatEventStatus: InChatEventStatus.values.byName(inChatEventStatus),
      inChatDataType: InChatDataType.values.byName(inChatDataType),
      contents: contents,
    );
  }
}
