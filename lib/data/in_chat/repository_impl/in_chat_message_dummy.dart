import 'package:sottie_flutter/data/in_chat/model/in_chat_event_model.dart';

Future<InChatEventListModel> getInChatMessageDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return InChatEventListModel(
    roomId: '1',
    inChatEventList: <InChatEventModel>[],
  );
}
