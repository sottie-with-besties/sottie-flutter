import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_tap_widget.dart';

class DmChatRoom extends StatefulWidget {
  const DmChatRoom({
    super.key,
    required this.model,
  });

  final DmModel model;

  @override
  State<DmChatRoom> createState() => _DmChatRoomState();
}

class _DmChatRoomState extends State<DmChatRoom> {
  void _alarmOnOffAction(bool withSlide) {
    log("DmAction");
  }

  void _chatRoomOutAction(bool withSlide) {
    log("DeleteAction");
  }

  @override
  Widget build(BuildContext context) {
    return SlideTapWidget(
      height: 70,
      groupTag: 'dm',
      onTap: () {
        context.push(
          '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
          extra: {
            'id': widget.model.id,
            'title': widget.model.name,
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
            icon: Icons.messenger_outline,
            optionTitle: "알람 Off",
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: Colors.redAccent,
            onTap: () {
              _chatRoomOutAction(false);
            },
            icon: Icons.delete_forever,
            optionTitle: "채팅 삭제",
          ),
        ],
      ),
      slideActions: [
        SlidableAction(
          onPressed: (context) => _alarmOnOffAction(true),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.messenger_outline,
          label: '알람 Off',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _chatRoomOutAction(true),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.delete,
          label: '채팅 삭제',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RandomAvatar(
                  DateTime.now().toIso8601String(),
                  width: 45 * hu,
                  height: 45 * hu,
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12 * hu,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.model.latestMsg,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10 * hu,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IntrinsicHeight(
              child: SizedBox(
                width: 60 * wu,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.latestTime,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10 * hu,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 40 * wu,
                      height: 25 * hu,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          widget.model.notReadMsg.toString(),
                          style: const TextStyle(
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
