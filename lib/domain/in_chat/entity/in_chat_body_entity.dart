import 'package:sottie_flutter/domain/in_chat/entity/in_chat_enum.dart';

final class InChatBodyEntity {
  final InChatEvent inChatEvent;
  final InChatDataEntity inChatDataEntity;

  InChatBodyEntity({required this.inChatEvent, required this.inChatDataEntity});
}

final class InChatDataEntity {
  final int userId;
  final String messageId;
  final String contents;
  final DateTime timeStamp;
  final InChatMessageType inChatMessageType;
  final InChatChatType inChatChatType;
  final InChatStatus inChatStatus;

  InChatDataEntity({
    required this.userId,
    required this.messageId,
    required this.contents,
    required this.timeStamp,
    required this.inChatMessageType,
    required this.inChatChatType,
    required this.inChatStatus,
  });
}
