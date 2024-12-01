import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_location.dart';
import 'package:sottie_flutter/domain/chat/chat_room_waiting_provider.dart';
import 'package:sottie_flutter/ui/chat/controller/chat_header_controller.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class ChatRoomWaitingScreen extends ConsumerWidget {
  const ChatRoomWaitingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomWaitingState = ref.watch(chatRoomWaitingStateProvider);
    final inputText = ref.watch(chatHeaderControllerProvider);

    return chatRoomWaitingState.when(
      data: (data) {
        final chatRoomWaitingList = data.where((data) {
          final dateString =
              convertDateTimeIntoString(data.gatheringDate.toLocal());
          final searched = data.title.toString().contains(inputText) ||
              dateString.toString().contains(inputText) ||
              SottieLocation.values[data.locationId].name.contains(inputText);

          return searched;
        });

        if (chatRoomWaitingList.isEmpty) {
          return const Center(
            child: Text("채팅방이 존재하지 않습니다"),
          );
        }

        return ListView(
          children: chatRoomWaitingList
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
