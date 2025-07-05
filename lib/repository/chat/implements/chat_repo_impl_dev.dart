import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/chat/interface/chat_repository.dart';

final class ChatRepoImplDev implements ChatRepository {
  @override
  Future<List<ChatRoomModel>> getChatRoomList() async {
    // Todo: Rest Api 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }

  @override
  Future<List<PostModel>> getChatRoomWaitingList() async {
    // Todo: Rest Api 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }

  @override
  Future<List<DmModel>> getDmList() async {
    // Todo: Rest Api 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }

  @override
  Future<void> exitChatRoom({required String chatRoomId}) {
    // TODO: implement exitChatRoom
    throw UnimplementedError();
  }
}
