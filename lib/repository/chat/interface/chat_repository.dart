import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_repo_impl_dummy.dart';

abstract interface class ChatRepository {
  factory ChatRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => ChatRepoImplDummy(),
      ServerEnvironment.dev => ChatRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  // 채팅방 불러오기
  Future<List<ChatRoomModel>> getChatRoomList();

  // 채팅 대기방 불러오기
  Future<List<PostModel>> getChatRoomWaitingList();

  // DM 불러오기
  Future<List<DmModel>> getDmList();

  // 채팅방 나가기
  Future<void> exitChatRoom({required String chatRoomId});
}
