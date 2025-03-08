import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/data/chat/model/dm_model.dart';

abstract interface class PostRepository {
  /// 채팅방 불러오기
  Future<List<ChatRoomModel>> getChatRoomList();

  /// 채팅방 불러오기
  Future<List<DmModel>> getDmList();
}
