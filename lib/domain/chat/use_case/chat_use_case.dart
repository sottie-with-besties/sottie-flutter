import 'package:sottie_flutter/domain/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/domain/chat/entity/dm_entity.dart';

final class ChatUseCase {
  /// 채팅방 가져오기
  Future<List<ChatRoomEntity>> getChatList() async {
    return [];
  }

  /// Dm 가져오기
  Future<List<DmEntity>> getDmList() async {
    return [];
  }
}
