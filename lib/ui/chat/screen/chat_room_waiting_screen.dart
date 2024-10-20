import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/chat/chat_room_waiting_provider.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';
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
              .map(
                (e) => SlideLongPressWidget(
                  groupTag: 'chat',
                  onLongPressWidget: Column(
                    children: [
                      OnLongPressOption(
                        color: mainRedColor,
                        onTap: () {
                          _chatRoomOutAction(false);
                        },
                        icon: FontAwesomeIcons.outdent,
                        optionTitle: "채팅방 나가기",
                      ),
                    ],
                  ),
                  slideActions: [
                    SlidableAction(
                      onPressed: (context) => _chatRoomOutAction(true),
                      backgroundColor: mainRedColor,
                      foregroundColor: Colors.white,
                      autoClose: true,
                      icon: FontAwesomeIcons.outdent,
                      label: '나가기',
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                    ),
                  ],
                  child: Post(
                    model: e,
                    isWaiting: true,
                  ),
                ),
              )
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

void _chatRoomOutAction(bool withSlide) {
  log("DeleteAction");
}
