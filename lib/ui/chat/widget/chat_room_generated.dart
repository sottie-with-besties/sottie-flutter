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

class ChatRoomGenerated extends StatefulWidget {
  const ChatRoomGenerated({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  State<ChatRoomGenerated> createState() => _ChatRoomGeneratedState();
}

class _ChatRoomGeneratedState extends State<ChatRoomGenerated> {
  bool chattingOver = false;
  Duration chatRoomDisappearingTime = const Duration(hours: 24);

  void _alarmOnOffAction(bool withSlide) {
    log("DmAction");
  }

  void _chatRoomOutAction(bool withSlide) {
    log("DeleteAction");
  }

  @override
  void initState() {
    super.initState();

    /// 채팅 모임 날짜 기준 24시간 경과 후 채팅방이 사라지기 시작함. 24시간 후 완전히 사라짐.
    /// 모임 날짜 + 24시간 까지 채팅 가능, 그 이후 24시간 채팅방 삭제 대기
    /// inDays == 1은 시간 차이가 24시간 이상 48시간 미만을 의미
    final generatedDate = DateTime.parse(widget.model.date);
    final now = DateTime.now();
    final du = now.difference(generatedDate);
    if (du.inDays == 1) {
      chattingOver = true;
      chatRoomDisappearingTime = du;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTapWidget(
      height: 130,
      groupTag: 'chat',
      onTap: () {
        context.push(
          '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
          extra: {
            'id': widget.model.id,
            'title': widget.model.chatTitle,
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
          ChatRoomTop(model: widget.model),
          SizedBox(height: 10 * hu),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChatRoomProfiles(
                profileCount: widget.model.profileThumbnails.length > 4
                    ? 4
                    : widget.model.profileThumbnails.length,
                profileSize:
                    widget.model.profileThumbnails.length < 2 ? 45.0 : 30.0,
              ),
              ChatRoomInfo(
                date: widget.model.date,
                location: widget.model.location,
                chatTitle: widget.model.chatTitle,
                latestMsg: widget.model.latestMsg!,
                latestTime: widget.model.latestTime!,
                notReadMsg: widget.model.notReadMsg!,
              ),
            ],
          )
        ],
      ),
    );
  }
}
