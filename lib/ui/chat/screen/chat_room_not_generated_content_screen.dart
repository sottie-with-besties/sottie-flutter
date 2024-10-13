import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/chat/chat_room_not_generated_provider.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_not_generated.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class ChatRoomNotGeneratedContentScreen extends ConsumerWidget {
  const ChatRoomNotGeneratedContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomNotGeneratedStateProvider);

    return chatRoomState.when(
      data: (data) {
        return ListView(
          children: data.map((e) => ChatRoomNotGenerated(model: e)).toList(),
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
