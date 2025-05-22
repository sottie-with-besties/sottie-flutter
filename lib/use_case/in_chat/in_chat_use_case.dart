import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_message_dummy.dart';

sealed class InChatUseCase {
  static Future<InChatEventListModel> getInChatEventList() async {
    final inChatEventListModel = await getInChatMessageDummy();

    return inChatEventListModel;
  }
}
