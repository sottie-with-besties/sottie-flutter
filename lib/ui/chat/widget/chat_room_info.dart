import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.date,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
    required this.isChattingOver,
    this.chatRoomDisappearingTime = const Duration(hours: 23),
  });

  final String date;
  final String location;
  final String chatTitle;
  final String latestMsg;
  final String latestTime;
  final int notReadMsg;
  final bool isChattingOver;
  final Duration? chatRoomDisappearingTime;

  @override
  Widget build(BuildContext context) {
    final numOfMsg = notReadMsg > 999 ? '999+' : notReadMsg.toString();
    final date = DateTime.parse(this.date).toLocal();

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
                        renderCustomStringTime(latestTime,
                            DateTime.now().toUtc().toIso8601String()),
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
                    _ChatRoomDestroyingTimer(
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
                          "${date.month}월 ${date.day}일 ${renderCustomStringTime(date.toString(), date.toString())}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          location,
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

class _ChatRoomDestroyingTimer extends StatefulWidget {
  const _ChatRoomDestroyingTimer({required this.timeLeft});

  final Duration timeLeft;

  @override
  State<_ChatRoomDestroyingTimer> createState() =>
      _ChatRoomDestroyingTimerState();
}

class _ChatRoomDestroyingTimerState extends State<_ChatRoomDestroyingTimer> {
  Duration timeLeftNow = const Duration();

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(d.inHours);
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    timeLeftNow = widget.timeLeft;

    /// 채팅 종료 24시간 후 ~ 48시간 후 까지 이므로 48시간(172800초)에서 (현재 날짜 - 모임 날짜)(timeLeft)를 빼야 한다.
    int seconds = 172800 - timeLeftNow.inSeconds;
    timeLeftNow = Duration(seconds: seconds);
    setState(() {});

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds -= 1;
        if (seconds < 0) {
          timer.cancel();
        } else {
          timeLeftNow = Duration(seconds: seconds);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDuration(timeLeftNow),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
