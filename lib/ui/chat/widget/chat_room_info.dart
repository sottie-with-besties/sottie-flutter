import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class ChatRoomInfo extends StatefulWidget {
  const ChatRoomInfo({
    super.key,
    required this.date,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });

  final String date;
  final String location;
  final String chatTitle;
  final String latestMsg;
  final String latestTime;
  final int notReadMsg;

  @override
  State<ChatRoomInfo> createState() => _ChatRoomInfoState();
}

class _ChatRoomInfoState extends State<ChatRoomInfo> {
  bool chattingOver = false;
  Duration? chatRoomDisappearingTime;

  @override
  void initState() {
    super.initState();

    /// 채팅 모임 날짜 기준 24시간 경과 후 채팅방이 사라지기 시작함. 24시간 후 완전히 사라짐.
    /// 모임 날짜 + 24시간 까지 채팅 가능, 그 이후 24시간 채팅방 삭제 대기
    /// inDays == 1은 시간 차이가 24시간 이상 48시간 미만을 의미
    final generatedDate = DateTime.parse(widget.date);

    /// utc로 변환해주지 않으면 한국 시간과 utc 시간으로 비교가 되어 정확한 시간 차이를 계산할 수 없다.
    final now = DateTime.now().toUtc();
    final du = now.difference(generatedDate);
    log(du.inHours.toString());
    if (du.inDays == 1) {
      chattingOver = true;
      chatRoomDisappearingTime = du;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final numOfMsg =
        widget.notReadMsg > 999 ? '999+' : widget.notReadMsg.toString();
    final date = DateTime.parse(widget.date);

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
              widget.chatTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12 * hu,
              ),
            ),
          ),
          SizedBox(height: 3 * hu),
          chattingOver
              ? Text(
                  "채팅이 종료되었습니다",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10 * hu,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150 * wu,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        widget.latestMsg,
                        style: TextStyle(
                          fontSize: 10 * hu,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50 * wu,
                      child: Text(
                        renderCustomStringTime(widget.latestTime,
                            DateTime.now().toUtc().toIso8601String()),
                        style: TextStyle(
                          fontSize: 8 * hu,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 10 * hu),
          chattingOver
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "채팅방이 자동으로 종료됩니다",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10 * wu,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
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
                          "${date.year}년 ${date.month}월 ${date.day}일 ${renderCustomStringTime(widget.date, widget.date)}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          widget.location,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (widget.notReadMsg != 0)
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
