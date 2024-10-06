import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_profiles.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_top.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_tap_widget.dart';

class ChatRoomGenerated extends StatelessWidget {
  const ChatRoomGenerated({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  Widget build(BuildContext context) {
    return SlideTapWidget(
      height: 130,
      groupTag: 'chat',
      onTap: () {
        context.push(
          '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
          extra: {
            'id': model.id,
            'title': model.chatTitle,
            'isGenerated': true,
          },
        );
      },
      onLongPressWidget: Column(
        children: [
          OnLongPressOption(
            color: Colors.grey,
            onTap: () {
              _alarmOnOffAction(false);
            },
            icon: Icons.alarm_off,
            optionTitle: "알람 끄기",
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: Colors.redAccent,
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
          onPressed: (context) => _alarmOnOffAction(true),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.alarm_off,
          label: '알람 끄기',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _chatRoomOutAction(true),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: FontAwesomeIcons.outdent,
          label: '나가기',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ],
      child: Column(
        children: [
          ChatRoomTop(model: model),
          SizedBox(height: 10 * hu),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChatRoomProfiles(
                profileCount: model.profileThumbnails.length > 4
                    ? 4
                    : model.profileThumbnails.length,
                profileSize: model.profileThumbnails.length < 2 ? 45.0 : 30.0,
              ),
              ChatRoomInfo(
                date: model.date,
                location: model.location,
                chatTitle: model.chatTitle,
                latestMsg: model.latestMsg!,
                latestTime: model.latestTime!,
                notReadMsg: model.notReadMsg!,
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _alarmOnOffAction(bool withSlide) {
  log("DmAction");
}

void _chatRoomOutAction(bool withSlide) {
  log("DeleteAction");
}
