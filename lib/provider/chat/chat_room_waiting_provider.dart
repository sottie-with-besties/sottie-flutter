import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/repository/chat/implements/chat_room_waiting_dummy.dart';
import 'package:sottie_flutter/model/post/dto/post_dto.dart';

part 'chat_room_waiting_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomWaitingState extends _$ChatRoomWaitingState {
  @override
  Future<List<PostDTO>> build() {
    return getChatRoomWaitingDummy();
  }
}
