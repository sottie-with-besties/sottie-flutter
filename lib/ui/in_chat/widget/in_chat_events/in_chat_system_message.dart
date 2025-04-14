import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/chat_room_destroying_timer.dart';

/// 채팅방 시스템 메세지 위젯 (채팅이 시작되었습니다, ~가 입장하였습니다 등)
class InChatUserAccessMessage extends StatelessWidget {
  const InChatUserAccessMessage({
    super.key,
    required this.eventType,
    required this.nickname,
  });

  /// 시스템 메시지를 표시할 이벤트
  final InChatEventType eventType;

  /// 이벤트를 발생시킨 사용자의 닉네임
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * hu),
      child: Container(
        decoration: BoxDecoration(
          color: mainBlueColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16 * wu, vertical: 8 * hu),
        child: Text(
          _buildMessage(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12 * hu,
            color: mainBlackColor.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  /// 이벤트 타입에 따라 시스템 메시지 생성
  String _buildMessage() {
    switch (eventType) {
      case InChatEventType.ENTRANCE:
        return '$nickname님이 채팅방에 입장했습니다.';
      case InChatEventType.EXIT:
        return '$nickname님이 채팅방을 나갔습니다.';
      default:
        return ''; // CHAT 이벤트는 시스템 메시지로 표시하지 않음
    }
  }
}

/// 채팅 시작 메세지 위젯
class InChatStartMessage extends StatelessWidget {
  const InChatStartMessage({
    super.key,
    required this.message,
    this.backgroundColor,
  });

  final String message;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12 * hu),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? mainBlueColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12 * hu),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13 * hu, color: mainBlackColor),
        ),
      ),
    );
  }
}

/// 채팅 종료 메시지 위젯
class InChatEndMessage extends StatelessWidget {
  const InChatEndMessage({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toLocal();
    final gatheringDate = date.toLocal();
    final timeLeft = now.difference(gatheringDate);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: mainBlueColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              '채팅이 종료되었습니다.\n시간이 경과하기 전에 참여자들을 리뷰하면 당신의 매너온도가 1°C 상승합니다.',
            ),
            SizedBox(height: 10 * hu),
            ChatRoomDestroyingTimer(key: UniqueKey(), timeLeft: timeLeft),
          ],
        ),
      ),
    );
  }
}

/// 날짜 구분선 위젯
class InChatDateDivider extends StatelessWidget {
  const InChatDateDivider({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final sentTimeString =
        "${date.month}월 ${date.day}일 ${convertIntToWeekday(date.weekday)}";

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16 * hu),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: mainGreenColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16 * wu, vertical: 8 * hu),
          child: Text(
            sentTimeString,
            style: TextStyle(
              fontSize: 13 * hu,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
