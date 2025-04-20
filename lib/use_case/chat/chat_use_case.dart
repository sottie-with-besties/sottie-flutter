import 'package:sottie_flutter/model/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/model/chat/entity/dm_entity.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_room_dummy.dart';
import 'package:sottie_flutter/repository/chat/implements/dm_dummy.dart';

final class ChatUseCase {
  static final ChatUseCase _instance = ChatUseCase._();

  factory ChatUseCase() => _instance;

  ChatUseCase._();

  /// 채팅방 가져오기
  Future<List<ChatRoomEntity>> getChatList() async {
    final chatRoomModelList = await getChatRoomDummy();
    final chatRoomEntityList =
        chatRoomModelList
            .map((model) => ChatRoomEntity.fromDTO(model: model))
            .toList();

    return chatRoomEntityList;
  }

  /// Dm 가져오기
  Future<List<DmEntity>> getDmList() async {
    final dmModelList = await getDmDummy();
    final dmEntityList =
        dmModelList.map((model) => DmEntity.fromDTO(model: model)).toList();

    return dmEntityList;
  }
}
