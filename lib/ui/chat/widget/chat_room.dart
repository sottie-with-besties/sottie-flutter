import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_profiles.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_sub_info.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({
    super.key,
    required this.roomInfo,
  });

  final Map<String, dynamic> roomInfo;

  @override
  Widget build(BuildContext context) {
    final date = roomInfo['date'];
    final location = roomInfo['location'];
    final chatTitle = roomInfo['chatTitle'];
    final latestMsg = roomInfo['latestMsg'];
    final numOfMember = roomInfo['numOfMember'];
    final latestTime = roomInfo['latestTime'];
    final notReadMsg = roomInfo['notReadMsg'];

    final profileSize = numOfMember < 2 ? 60.r : 40.r;
    final profileCount = numOfMember > 4 ? 4 : numOfMember;

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
                    date: date,
                    location: location,
                    chatTitle: chatTitle,
                    latestMsg: latestMsg,
                    numOfMember: numOfMember,
                  ),
                  ChatRoomSubInfo(
                    numOfMember: numOfMember,
                    latestTime: latestTime,
                    notReadMsg: notReadMsg,
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
