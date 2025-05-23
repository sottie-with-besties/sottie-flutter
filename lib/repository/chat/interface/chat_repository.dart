import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_repo_impl_dev.dart';

abstract interface class ChatRepository {
  factory ChatRepository() {
    return ChatRepoImplDev();
  }

  /// 채팅방 불러오기
  Future<List<ChatRoomModel>> getChatRoomList();

  /// 채팅 대기방 불러오기
  Future<List<PostModel>> getChatRoomWaitingList();

  /// 채팅방 불러오기
  Future<List<DmModel>> getDmList();
}
