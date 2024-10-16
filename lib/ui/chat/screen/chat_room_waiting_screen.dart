import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/chat/chat_room_waiting_provider.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class ChatRoomWaitingScreen extends ConsumerWidget {
  const ChatRoomWaitingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomWaitingStateProvider);

    return chatRoomState.when(
      data: (data) {
        return ListView(
          children: data
              .map((e) => Post(
                    model: e,
                    isWaiting: true,
                  ))
              .toList(),
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

void _alarmOnOffAction(bool withSlide) {
  log("alarmOnOffAction");
}

void _chatRoomOutAction(bool withSlide) {
  log("DeleteAction");
}
