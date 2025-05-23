import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';

part 'chat_room_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomState extends _$ChatRoomState {
  @override
  Future<List<ChatRoomModel>> build() {
    return ChatUseCase.getChatRoomList();
  }
}
