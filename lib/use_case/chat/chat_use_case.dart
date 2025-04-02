import 'package:sottie_flutter/model/chat/dto/chat_room_dto.dart';
import 'package:sottie_flutter/model/chat/dto/dm_dto.dart';
import 'package:sottie_flutter/model/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/model/chat/entity/dm_entity.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_room_dummy.dart';
import 'package:sottie_flutter/repository/chat/implements/dm_dummy.dart';

final class ChatUseCase {
  /// 채팅방 가져오기
  Future<List<ChatRoomEntity>> getChatList() async {
    final chatRoomEntityList = <ChatRoomEntity>[];
    final chatRoomModelList = await getChatRoomDummy();

    for (ChatRoomDTO model in chatRoomModelList) {
      chatRoomEntityList.add(ChatRoomEntity.fromDTO(model: model));
    }

    return chatRoomEntityList;
  }

  /// Dm 가져오기
  Future<List<DmEntity>> getDmList() async {
    final dmEntityList = <DmEntity>[];
    final dmModelList = await getDmDummy();

    for (DmDTO model in dmModelList) {
      dmEntityList.add(DmEntity.fromDTO(model: model));
    }

    return dmEntityList;
  }
}
