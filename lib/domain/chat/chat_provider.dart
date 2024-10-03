import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/chat/data_source/chat_room_dummy.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomState extends _$ChatRoomState {
  @override
  FutureOr<List<ChatRoomModel>> build() {
    return getChatRoomDummy();
  }
}
