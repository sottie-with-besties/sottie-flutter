import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/chat/data_source/chat_room_generated_dummy.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_generated_model.dart';

part 'chat_room_generated_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomGeneratedState extends _$ChatRoomGeneratedState {
  @override
  Future<List<ChatRoomGeneratedModel>> build() {
    return getChatRoomGeneratedDummy();
  }
}
