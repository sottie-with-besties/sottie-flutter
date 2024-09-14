import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/chat/chat_provider.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_generated.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class ChatContentScreen extends ConsumerWidget {
  const ChatContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomStateProvider);

    return chatRoomState.when(
      data: (data) {
        final generatedChatRoomList =
            data.where((chatRoom) => chatRoom.isChatRoomGenerated).toList();

        final notGeneratedChatRoomList =
            data.where((chatRoom) => !chatRoom.isChatRoomGenerated).toList();

        return ListView(
          children: [
            if (generatedChatRoomList.isNotEmpty)
              ...generatedChatRoomList.map((e) => ChatRoomGenerated(model: e)),
            if (notGeneratedChatRoomList.isNotEmpty)
              ...notGeneratedChatRoomList
                  .map((e) => ChatRoomGenerated(model: e)),
          ],
        );
      },
      error: (_, __) {
        return const Center(
          child: Text("데이터를 가져올 수 없습니다."),
        );
      },
      loading: () => const LoadingSkeleton(),
    );
  }
}
