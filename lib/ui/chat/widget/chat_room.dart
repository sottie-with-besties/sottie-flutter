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
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  Widget build(BuildContext context) {
    bool isChattingOver = false;
    Duration chatRoomDisappearingTime = const Duration(hours: 23);

    /// 채팅 모임 날짜 기준 24시간 경과 후 채팅방이 사라지기 시작함. 24시간 후 완전히 사라짐.
    /// 모임 날짜 + 24시간 까지 채팅 가능, 그 이후 24시간 채팅방 삭제 대기
    final generatedDate = DateTime.parse(model.date);

    /// utc로 변환해주지 않으면 한국 시간과 utc 시간으로 비교가 되어 정확한 시간 차이를 계산할 수 없다.
    final now = DateTime.now().toUtc();
    final du = now.difference(generatedDate);

    /// inDays == 1은 시간 차이가 24시간 이상 48시간 미만을 의미
    if (du.inDays == 1) {
      isChattingOver = true;
      chatRoomDisappearingTime = du;
    }

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
              'isChattingOver': isChattingOver,
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
                  padding: EdgeInsets.symmetric(horizontal: 12 * wu),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SottieCategoryUi(sottieCategory: model.category),
                      CurrentNumOfMember(
                        currentMemberCount: model.currentMemberCount,
                        maxMemberCount: model.maxMemberCount,
                        currentManCount: model.currentManCount,
                        maxManCount: model.maxManCount,
                        currentWomanCount: model.currentWomanCount,
                        maxWomanCount: model.maxWomanCount,
                      ),
                    ],
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
                      isChattingOver: isChattingOver,
                      chatRoomDisappearingTime: chatRoomDisappearingTime,
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
