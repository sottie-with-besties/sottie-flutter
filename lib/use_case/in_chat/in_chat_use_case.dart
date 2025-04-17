import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_message_dummy.dart';

final class InChatUseCase {
  Future<InChatEventListEntity> getInChatEventList() async {
    final inChatEventListDTO = await getInChatMessageDummy();

    return InChatEventListEntity.fromDTO(model: inChatEventListDTO);
  }
}
