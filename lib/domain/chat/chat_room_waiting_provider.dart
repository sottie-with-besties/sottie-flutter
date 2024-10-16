import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/chat/data_source/chat_room_waiting_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';

part 'chat_room_waiting_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomWaitingState extends _$ChatRoomWaitingState {
  @override
  Future<List<PostModel>> build() {
    return getChatRoomWaitingDummy();
  }
}
