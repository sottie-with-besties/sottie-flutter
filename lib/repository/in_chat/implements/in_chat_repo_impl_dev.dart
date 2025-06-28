import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/interface/in_chat_repository_interface.dart';

final class InChatRepoImplDev implements InChatRepository {
  @override
  Future<InChatEventListModel> getInChatEventList({
    required String roomId,
  }) async {
    // TODO: implement getInChatEventListBefore
    throw UnimplementedError();
  }

  @override
  Future<List<InChatEventModel>> getInChatEventListBefore({
    required String roomId,
    required String lastEventId,
  }) {
    // TODO: implement getInChatEventListBefore
    throw UnimplementedError();
  }
}
