import 'package:sottie_flutter/data/chat/data_source/chat_room_dummy.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';

final class ChatProvider {
  Future<List<ChatRoomModel>> getChatRoom() async {
    final chatRooms = await getChatRoomDummy();
    return chatRooms;
  }
}
