import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_profiles.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_top.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  Widget build(BuildContext context) {
    return SlideLongPressWidget(
      groupTag: 'chat',
      onLongPressWidget: Column(
        children: [
          OnLongPressOption(
            color: mainGreyColor,
            onTap: () {
              _alarmOnOffAction(false);
            },
            icon: Icons.alarm_off,
            optionTitle: "알람 끄기",
          ),
          SizedBox(height: 10 * hu),
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
          onPressed: (context) => _alarmOnOffAction(true),
          backgroundColor: mainGreyColor,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.alarm_off,
          label: '알람 끄기',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
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
      child: GestureDetector(
        onTap: () {
          context.push(
            '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
            extra: {
              'id': model.id,
              'title': model.chatTitle,
            },
          );
        },
        child: Container(
          color: Colors.transparent, // GestureDetector에 모든 영역이 감지되기 위함
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 3 * wu, vertical: 12 * hu),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ChatRoomTop(
                    categories: model.category,
                    currentMemberCount: model.currentMemberCount,
                    maxMemberCount: model.maxMemberCount,
                    currentManCount: model.currentManCount,
                    maxManCount: model.maxManCount,
                    currentWomanCount: model.currentWomanCount,
                    maxWomanCount: model.maxWomanCount,
                  ),
                ),
                SizedBox(height: 10 * hu),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChatRoomProfiles(
                      profileCount: model.profileThumbnails.length > 4
                          ? 4
                          : model.profileThumbnails.length,
                      profileSize:
                          model.profileThumbnails.length < 2 ? 45.0 : 30.0,
                    ),
                    ChatRoomInfo(
                      date: model.date,
                      location: model.location,
                      chatTitle: model.chatTitle,
                      latestMsg: model.latestMsg,
                      latestTime: model.latestTime,
                      notReadMsg: model.notReadMsg,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _alarmOnOffAction(bool withSlide) {
  log("alarmOnOffAction");
}

void _chatRoomOutAction(bool withSlide) {
  log("DeleteAction");
}
