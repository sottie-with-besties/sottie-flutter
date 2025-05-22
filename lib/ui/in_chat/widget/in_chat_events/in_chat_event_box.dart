import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_events/in_chat_contents.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

/// 채팅방 이벤트 레이아웃
/// 사이드에 프로필 사진, 바로 옆에 컨텐츠, 하단에 시간
class InChatEventBox extends StatelessWidget {
  const InChatEventBox({
    super.key,
    required this.events,
    required this.isMyMessage,
    required this.userId,
    required this.profileUrl,
    required this.nickname,
  });

  /// 동일 시간대에 동일 유저가 보낸 메시지 목록 (연속 메시지)
  final List<InChatEventModel> events;

  /// 내 메시지인지 여부
  final bool isMyMessage;

  /// 메시지를 보낸 유저의 ID
  final String userId;

  /// 프로필 이미지 URL
  final String? profileUrl;

  /// 닉네임
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12 * ScreenSize.hu,
        horizontal: 8 * ScreenSize.wu,
      ),
      child: Row(
        mainAxisAlignment:
            isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 상대방 메시지일 때만 왼쪽에 프로필 표시
          if (!isMyMessage) ...[
            UserProfile(profileUrl: profileUrl),
            SizedBox(width: 8 * ScreenSize.wu),
          ],

          /// 프로필 너비 + 간격
          /// 메시지 컨텐츠 및 시간 영역
          Column(
            crossAxisAlignment:
                isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              /// 상대방 메시지일 때 닉네임 표시
              if (!isMyMessage)
                Padding(
                  padding: EdgeInsets.only(
                    left: 4 * ScreenSize.wu,
                    bottom: 4 * ScreenSize.hu,
                  ),
                  child: Text(
                    nickname,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12 * ScreenSize.hu,
                    ),
                  ),
                ),

              /// 메시지 컨텐츠 목록
              ...events.map(
                (event) => Padding(
                  padding: EdgeInsets.only(bottom: 2 * ScreenSize.hu),
                  child: InChatContents(
                    inChatEventModel: event,
                    isMyMessage: isMyMessage,
                    onTap: () {
                      /// 이미지, 비디오 등 특별한 컨텐츠 처리
                      if (event.inChatDataType != InChatDataType.TEXT) {
                        _handleSpecialContentTap(context, event);
                      }
                    },
                  ),
                ),
              ),

              /// 시간 표시
              Padding(
                padding: EdgeInsets.only(
                  top: 4 * ScreenSize.hu,
                  right: isMyMessage ? 4 * ScreenSize.wu : 0,
                  left: isMyMessage ? 0 : 4 * ScreenSize.wu,
                ),
                child: Text(
                  _formatMessageTime(events.last.timeStamp),
                  style: TextStyle(
                    fontSize: 10 * ScreenSize.hu,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 시간 형식 지정 (월 일 시 분)
  String _formatMessageTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(time.year, time.month, time.day);

    String timeStr =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    /// 오늘 메시지는 시간만 표시
    if (messageDate == today) {
      return timeStr;
    }

    /// 어제 메시지
    if (messageDate == today.subtract(const Duration(days: 1))) {
      return '어제 $timeStr';
    }

    /// 이번 달 메시지
    if (messageDate.month == today.month && messageDate.year == today.year) {
      return '${time.day}일 $timeStr';
    }

    /// 올해 메시지
    if (messageDate.year == today.year) {
      return '${time.month}월 ${time.day}일 $timeStr';
    }

    /// 그 외
    return '${time.year}년 ${time.month}월 ${time.day}일 $timeStr';
  }

  /// 특별한 컨텐츠(이미지, 비디오)를 탭했을 때 처리
  void _handleSpecialContentTap(BuildContext context, InChatEventModel model) {
    switch (model.inChatDataType) {
      case InChatDataType.IMAGE:

        /// TODO: 이미지 확대 보기 구현
        break;
      case InChatDataType.VIDEO:

        /// TODO: 비디오 플레이어 실행 구현
        break;
      default:
        break;
    }
  }
}
