import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';

part 'chat_room_waiting_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomWaitingState extends _$ChatRoomWaitingState {
  @override
  Future<List<PostModel>> build() {
    return ChatUseCase.getChatRoomWaitingList();
  }
}
