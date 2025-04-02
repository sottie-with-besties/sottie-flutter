import 'package:sottie_flutter/model/chat/dto/chat_room_dto.dart';
import 'package:sottie_flutter/model/chat/dto/dm_dto.dart';

abstract interface class PostRepository {
  /// 채팅방 불러오기
  Future<List<ChatRoomDTO>> getChatRoomList();

  /// 채팅방 불러오기
  Future<List<DmDTO>> getDmList();
}
