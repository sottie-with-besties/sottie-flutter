import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_location.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/chat_room_destroying_timer.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.gatheringDate,
    required this.locationId,
    required this.chatTitle,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
    required this.isChattingOver,
    this.chatRoomDisappearingTime = const Duration(hours: 23),
  });

  final DateTime gatheringDate;
  final int locationId;
  final String chatTitle;
  final String latestMsg;
  final DateTime latestTime;
  final int notReadMsg;
  final bool isChattingOver;
  final Duration? chatRoomDisappearingTime;

  @override
  Widget build(BuildContext context) {
    final numOfMsg = notReadMsg > 999 ? '999+' : notReadMsg.toString();
    final date = gatheringDate.toLocal();

    return SizedBox(
      width: 220 * wu,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200 * wu,
            child: Text(
              overflow: TextOverflow.ellipsis,
              chatTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12 * hu,
              ),
            ),
          ),
          SizedBox(height: 3 * hu),
          isChattingOver
              ? Text(
                  "채팅이 종료되었습니다",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10 * hu,
                    fontWeight: FontWeight.bold,
                    color: mainGreyColor2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150 * wu,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        latestMsg,
                        style: TextStyle(
                          fontSize: 10 * hu,
                          fontWeight: FontWeight.bold,
                          color: mainGreyColor2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50 * wu,
                      child: Text(
                        renderCustomStringTime(
                          latestTime.toLocal(),
                          DateTime.now().toLocal(),
                        ),
                        style: TextStyle(
                          fontSize: 8 * hu,
                          color: mainGreyColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 10 * hu),
          isChattingOver
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "채팅방이 자동으로 종료됩니다",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10 * wu,
                        fontWeight: FontWeight.bold,
                        color: mainGreyColor2,
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
                          SottieLocation.values[locationId].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (notReadMsg != 0)
                      Padding(
                        padding: EdgeInsets.only(right: 12 * wu),
                        child: Container(
                          decoration: BoxDecoration(
                            color: mainRedColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 40 * wu,
                          height: 20 * hu,
                          padding: EdgeInsets.all(3 * hu),
                          child: FittedBox(
                            child: Text(
                              numOfMsg,
                              style: const TextStyle(
                                color: mainWhiteSilverColor,
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
