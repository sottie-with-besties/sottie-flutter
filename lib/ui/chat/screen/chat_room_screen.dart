import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/chat/chat_room_provider.dart';
import 'package:sottie_flutter/ui/chat/controller/chat_header_controller.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class ChatRoomScreen extends ConsumerWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomStateProvider);
    final inputText = ref.watch(chatHeaderControllerProvider);

    return chatRoomState.when(
      data: (data) {
        final chatRoomList = data.where((data) {
          final dateString =
              convertDateTimeIntoString(DateTime.parse(data.date).toLocal());
          final searched = data.chatTitle.toString().contains(inputText) ||
              data.latestMsg.toString().contains(inputText) ||
              dateString.toString().contains(inputText) ||
              data.location.toString().contains(inputText);

          return searched;
        });

        if (chatRoomList.isEmpty) {
          return const Center(
            child: Text("채팅방이 존재하지 않습니다"),
          );
        }

        return ListView(
          children: chatRoomList
              .map<Widget>((data) => ChatRoom(model: data))
              .toList(),
        );
      },
      error: (_, __) {
        return const Center(
          child: Text("채팅방을 불러오는 도중 에러가 발생했습니다"),
        );
      },
      loading: () => const LoadingSkeleton(),
    );
  }
}
