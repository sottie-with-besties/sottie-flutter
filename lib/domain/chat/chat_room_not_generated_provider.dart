import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/chat/data_source/chat_room_not_generated_dummy.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_not_generated_model.dart';

part 'chat_room_not_generated_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomNotGeneratedState extends _$ChatRoomNotGeneratedState {
  @override
  Future<List<ChatRoomNotGeneratedModel>> build() {
    return getChatRoomNotGeneratedDummy();
  }
}
