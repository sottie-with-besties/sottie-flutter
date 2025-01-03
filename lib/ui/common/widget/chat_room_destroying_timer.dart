import 'dart:async';

import 'package:flutter/material.dart';

class ChatRoomDestroyingTimer extends StatefulWidget {
  const ChatRoomDestroyingTimer({super.key, required this.timeLeft});

  final Duration timeLeft;

  @override
  State<ChatRoomDestroyingTimer> createState() =>
      _ChatRoomDestroyingTimerState();
}

class _ChatRoomDestroyingTimerState extends State<ChatRoomDestroyingTimer> {
  Duration timeLeftNow = const Duration();
  Timer? timer;

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

    if (seconds <= 0) {
      timeLeftNow = const Duration(seconds: 0);
      return;
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
  void dispose() {
    timer?.cancel();
    super.dispose();
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
