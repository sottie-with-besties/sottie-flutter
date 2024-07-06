import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_profiles.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_sub_info.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  Widget build(BuildContext context) {
    final profileSize = model.numOfMember < 2 ? 60.r : 40.r;
    final profileCount = model.numOfMember > 4 ? 4 : model.numOfMember;

    return Material(
      color: mainSilverColor,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 120.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChatRoomProfiles(
                    profileCount: profileCount,
                    profileSize: profileSize,
                  ),
                  ChatRoomInfo(
                    date: model.date,
                    location: model.location,
                    chatTitle: model.chatTitle,
                    latestMsg: model.latestMsg,
                    numOfMember: model.numOfMember,
                  ),
                  ChatRoomSubInfo(
                    numOfMember: model.numOfMember,
                    latestTime: model.latestTime,
                    notReadMsg: model.notReadMsg,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
