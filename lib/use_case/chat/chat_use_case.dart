import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_room_dummy.dart';
import 'package:sottie_flutter/repository/chat/implements/dm_dummy.dart';

sealed class ChatUseCase {
  /// 채팅방 가져오기
  static Future<List<ChatRoomModel>> getChatList() async {
    final chatRoomModelList = await getChatRoomDummy();

    return chatRoomModelList;
  }

  /// Dm 가져오기
  static Future<List<DmModel>> getDmList() async {
    final dmModelList = await getDmDummy();

    return dmModelList;
  }
}
