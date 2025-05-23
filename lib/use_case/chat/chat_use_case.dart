import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/chat/interface/chat_repository.dart';

sealed class ChatUseCase {
  static final _repo = ChatRepository();

  /// 채팅방 가져오기
  static Future<List<ChatRoomModel>> getChatRoomList() async {
    final chatRoomModelList = await _repo.getChatRoomList();

    return chatRoomModelList;
  }

  static Future<List<PostModel>> getChatRoomWaitingList() async {
    final chatRoomWaitingList = await _repo.getChatRoomWaitingList();

    return chatRoomWaitingList;
  }

  /// Dm 가져오기
  static Future<List<DmModel>> getDmList() async {
    final dmModelList = await _repo.getDmList();

    return dmModelList;
  }
}
