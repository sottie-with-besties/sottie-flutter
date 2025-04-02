import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';

part 'chat_room_provider.g.dart';

@Riverpod(keepAlive: true)
final class ChatRoomState extends _$ChatRoomState {
  @override
  Future<List<ChatRoomEntity>> build() {
    final useCase = GetIt.I.get<ChatUseCase>();
    return useCase.getChatList();
  }
}
