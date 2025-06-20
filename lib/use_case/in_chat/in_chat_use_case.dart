import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/interface/in_chat_repository_interface.dart';

sealed class InChatUseCase {
  static final _repo = InChatRepository();

  static Future<InChatEventListModel> getInChatEventList() async {
    final inChatEventListModel = await _repo.getInChatEventList(
      roomId: "1231331",
    );

    return inChatEventListModel;
  }
}
