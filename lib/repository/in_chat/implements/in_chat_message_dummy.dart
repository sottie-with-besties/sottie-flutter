import 'package:sottie_flutter/model/in_chat/dto/in_chat_event_dto.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';

Future<InChatEventListDTO> getInChatMessageDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return InChatEventListDTO(
    roomId: "room_123",
    userList: [],
    inChatEventList: List.generate(12, (index) {
      int eventId = 12 - index;
      return InChatEventDTO(
        eventId: eventId.toString(),
        userId: (eventId % 3) + 1,
        inChatEventType:
            InChatEventType
                .values[eventId % InChatEventType.values.length]
                .name,
        timeStamp: DateTime.now().subtract(
          Duration(minutes: (12 - eventId) * 5),
        ),
        inChatEventStatus: InChatEventStatus.SUCCESS.name,
        inChatData: InChatDataDTO(
          dataId: "msg_$eventId",
          inChatDataType: InChatDataType.TEXT.name,
          contents: "Sample message content for event $eventId",
        ),
      );
    }),
  );
}
