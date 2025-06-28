import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/chat_room_destroying_timer.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.gatheringDate,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
    required this.isChattingOver,
    this.chatRoomDisappearingTime = const Duration(hours: 23),
  });

  final DateTime gatheringDate;
  final PostLocation location;
  final String chatTitle;
  final String latestMsg;
  final DateTime latestTime;
  final int notReadMsg;
  final bool isChattingOver;
  final Duration? chatRoomDisappearingTime;

  @override
  Widget build(BuildContext context) {
    final numOfNotReadMsg = notReadMsg > 999 ? '999+' : notReadMsg.toString();
    final date = gatheringDate.toLocal();

    return SizedBox(
      width: 220 * ScreenSize.wu,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200 * ScreenSize.wu,
            child: Text(
              overflow: TextOverflow.ellipsis,
              chatTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12 * ScreenSize.hu,
              ),
            ),
          ),
          SizedBox(height: 3 * ScreenSize.hu),
          isChattingOver
              ? Text(
                "채팅이 종료되었습니다",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10 * ScreenSize.hu,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyColor2,
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150 * ScreenSize.wu,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      latestMsg,
                      style: TextStyle(
                        fontSize: 10 * ScreenSize.hu,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50 * ScreenSize.wu,
                    child: Text(
                      convertDateTimeIntoString(latestTime),
                      style: TextStyle(
                        fontSize: 8 * ScreenSize.hu,
                        color: AppColors.greyColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          SizedBox(height: 10 * ScreenSize.hu),
          isChattingOver
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "채팅방이 자동으로 종료됩니다",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10 * ScreenSize.wu,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor2,
                    ),
                  ),
                  ChatRoomDestroyingTimer(
                    timeLeft:
                        chatRoomDisappearingTime ?? const Duration(hours: 23),
                  ),
                  Container(),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        convertDateTimeIntoString(date),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        location.koreanName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (notReadMsg != 0)
                    Padding(
                      padding: EdgeInsets.only(right: 12 * ScreenSize.wu),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.redColor.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 40 * ScreenSize.wu,
                        height: 20 * ScreenSize.hu,
                        padding: EdgeInsets.all(3 * ScreenSize.hu),
                        child: FittedBox(
                          child: Text(
                            numOfNotReadMsg,
                            style: const TextStyle(
                              color: AppColors.whiteSilverColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
        ],
      ),
    );
  }
}
