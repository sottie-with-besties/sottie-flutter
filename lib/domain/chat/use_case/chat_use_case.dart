import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/data/chat/model/dm_model.dart';
import 'package:sottie_flutter/data/chat/repository_impl/chat_room_dummy.dart';
import 'package:sottie_flutter/data/chat/repository_impl/dm_dummy.dart';
import 'package:sottie_flutter/domain/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/domain/chat/entity/dm_entity.dart';

final class ChatUseCase {
  /// 채팅방 가져오기
  Future<List<ChatRoomEntity>> getChatList() async {
    final chatRoomEntityList = <ChatRoomEntity>[];
    final chatRoomModelList = await getChatRoomDummy();

    for (ChatRoomModel model in chatRoomModelList) {
      chatRoomEntityList.add(ChatRoomEntity.fromModel(model: model));
    }

    return chatRoomEntityList;
  }

  /// Dm 가져오기
  Future<List<DmEntity>> getDmList() async {
    final dmEntityList = <DmEntity>[];
    final dmModelList = await getDmDummy();

    for (DmModel model in dmModelList) {
      dmEntityList.add(DmEntity.fromModel(model: model));
    }

    return dmEntityList;
  }
}
