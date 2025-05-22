import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';

abstract interface class PostRepository {
  /// 채팅방 불러오기
  Future<List<ChatRoomModel>> getChatRoomList();

  /// 채팅방 불러오기
  Future<List<DmModel>> getDmList();
}
