import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';

class DmChatRoom extends StatefulWidget {
  const DmChatRoom({super.key, required this.model});

  final DmModel model;

  @override
  State<DmChatRoom> createState() => _DmChatRoomState();
}

class _DmChatRoomState extends State<DmChatRoom> {
  @override
  Widget build(BuildContext context) {
    return SlideLongPressWidget(
      groupTag: 'dm',
      onLongPressWidget: Column(
        children: [
          OnLongPressOption(
            color: AppColors.greyColor,
            onTap: () {
              _alarmOnOffAction(false);
            },
            icon: Icons.messenger_outline,
            optionTitle: "알람 Off",
          ),
          SizedBox(height: 10 * ScreenSize.hu),
          OnLongPressOption(
            color: AppColors.redColor,
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
          backgroundColor: AppColors.greyColor,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.messenger_outline,
          label: '알람 Off',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _chatRoomOutAction(true),
          backgroundColor: AppColors.redColor,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.delete,
          label: '채팅 삭제',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          context.push(
            '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
            extra: {'dmModel': widget.model, 'isChattingOver': false},
          );
        },
        child: Container(
          color: Colors.transparent, // GestureDetector에 모든 영역이 감지되기 위함
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12 * ScreenSize.wu,
              vertical: 12 * ScreenSize.hu,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SottieUser(
                    model: widget.model.userModel,
                    heroTag: widget.model.userModel.id.toString(),
                    isMyFriend: true,
                    goToDetailPath: false,
                    textWidth: 120,
                  ),
                ),
                SizedBox(width: 10 * ScreenSize.wu),
                Padding(
                  padding: EdgeInsets.only(right: 8 * ScreenSize.wu),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        convertDateTimeIntoString(widget.model.latestTime),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 9 * ScreenSize.hu,
                        ),
                      ),
                      SizedBox(height: 5 * ScreenSize.hu),
                      Container(
                        width: 40 * ScreenSize.wu,
                        height: 20 * ScreenSize.hu,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.redColor.withValues(alpha: 0.8),
                        ),
                        child: Center(
                          child: Text(
                            widget.model.notReadMsg.toString(),
                            style: const TextStyle(
                              color: AppColors.whiteSilverColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
