import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_enum.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/model/user/entity/user_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_events/in_chat_event_box.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_events/in_chat_read_receipts.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_events/in_chat_system_message.dart';
import 'package:sottie_flutter/use_case/in_chat/in_chat_use_case.dart';

class InChatEventsLayout extends StatelessWidget {
  const InChatEventsLayout({
    super.key,
    required this.isChattingOver,
    required this.date,
  });

  /// 채팅 종료 여부
  final bool isChattingOver;

  /// 모임 날짜
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      futureFunction: InChatUseCase().getInChatEventList,
      loadingWidget: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50 * wu,
              child: LinearProgressIndicator(
                backgroundColor: mainGreyColor,
                color: mainBlueColor,
                borderRadius: BorderRadius.circular(8),
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "채팅을 불러오고 있습니다...",
              style: TextStyle(color: mainBlackColor),
            ),
          ],
        ),
      ),
      callBack: (futureDataEntity) {
        return _EventsList(
          entity: futureDataEntity,
          isChattingOver: isChattingOver,
          date: date,
        );
      },
    );
  }
}

class _EventsList extends StatefulWidget {
  const _EventsList({
    required this.entity,
    required this.isChattingOver,
    required this.date,
  });

  /// 서버로부터 받은 이벤트 리스트
  final InChatEventListEntity entity;

  /// 채팅 종료 여부
  final bool isChattingOver;

  /// 모임 날짜
  final DateTime date;

  @override
  State<_EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<_EventsList> with WidgetsBindingObserver {
  // didChangeMetrics
  double _viewInsetsBottom = 0;

  final _scrollController = ScrollController(keepScrollOffset: false);

  /// 내 ID Todo: (실제 구현 시 사용자 정보에서 가져와야 함)
  final int myId = 1;

  /// 이벤트 엔티티 리스트 및 그룹화 Todo: 리버팟으로 상태관리 재구성
  final List<List<InChatEventEntity>> _groupEvents = [];

  /// 사용자 엔티티 리스트
  final List<UserEntity> _users = [];

  /// 사용자 채팅 입퇴장 상태 Todo: 리버팟으로 상태관리 재구성
  final Map<String, bool?> userChatStatus = {};

  /// Todo: 나중에 소켓 연결했을 때 스트림 프로바이더에서 상태관리 전부 호출해주기

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _groupEvents.addAll(
      _groupConsecutiveMessages(widget.entity.inChatEventList),
    );
    _users.addAll(widget.entity.userList);

    for (UserEntity user in _users) {
      userChatStatus[user.id.toString()] = null;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  /// 키보드가 올라왔을 때 채팅창 스크롤을 맨 아래로 내리기
  @override
  void didChangeMetrics() {
    final bottom = View.of(context).viewInsets.bottom;

    if (_viewInsetsBottom != bottom) {
      _viewInsetsBottom = bottom;
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          reverse: true,
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),

          /// 종료 메시지 + 채팅 이벤트 그룹 목록 + 시작 메시지(있는 경우)
          itemCount: _groupEvents.length + 2,
          itemBuilder: (_, index) {
            /// 종료 메시지 (맨 아래에 표시)
            if (index == 0) {
              return widget.isChattingOver
                  ? InChatEndMessage(date: widget.date)
                  : const SizedBox();
            }

            /// 채팅방 시작 메시지 (맨 위에 표시) - 첫 메세지 위에 띄워야 함
            if (index == _groupEvents.length + 1 &&
                _groupEvents.last.first.eventId == '1') {
              return const InChatStartMessage(message: '채팅이 시작되었습니다.');
            }

            /// 인덱스 범위 에러 방지
            if (index > 0 && index <= _groupEvents.length) {
              /// 실제 메시지 그룹 처리
              final eventGroup = _groupEvents[index - 1];

              /// 날짜 변경 확인
              Widget dateDivider = const SizedBox();
              if (index > 1) {
                final prevGroup = _groupEvents[index - 2];
                if (_shouldShowDateDivider(eventGroup, prevGroup)) {
                  dateDivider = InChatDateDivider(
                    date: prevGroup.first.timeStamp,
                  );
                }
              }

              return Column(children: [_renderEvent(eventGroup), dateDivider]);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  /// 이벤트 유형에 따라 적절한 위젯 렌더링
  Widget _renderEvent(List<InChatEventEntity> eventGroup) {
    final event = eventGroup.first;

    switch (event.inChatEventType) {
      /// 입장 and 퇴장 이벤트 처리
      case InChatEventType.ENTRANCE || InChatEventType.EXIT:
        final user = _findUserById(event.userId);
        if (user != null) {
          return InChatUserAccessMessage(
            eventType: event.inChatEventType,
            nickname: user.nickname,
          );
        }
        return const SizedBox();

      /// 최초 1회만 정한다.
      case InChatEventType.CHAT_IN:
        if (userChatStatus[event.userId.toString()] == null) {
          userChatStatus[event.userId.toString()] = true;
        }
        break;

      case InChatEventType.CHAT_OUT:
        if (userChatStatus[event.userId.toString()] == null) {
          userChatStatus[event.userId.toString()] = false;
        }

        /// CHAT_OUT 이벤트에서 해당 유저들만 필터링하여 목록 생성
        /// 채팅방에 입장중인 유저는 제외(CHAT_IN이 이벤트 리스트에 먼저 있는 경우)
        final userList =
            _users
                .where(
                  (user) =>
                      eventGroup.any((event) => event.userId == user.id) &&
                      userChatStatus[user.id.toString()] == false,
                )
                .toList();
        return InChatReadReceipts(userList: userList);

      case InChatEventType.CHAT:

        /// 일반 채팅 메시지 처리
        final user = _findUserById(event.userId);
        if (user == null) return const SizedBox.shrink();

        /// 내 메시지인지 확인
        final isMyMessage = event.userId == myId;

        return InChatEventBox(
          events: eventGroup,
          isMyMessage: isMyMessage,
          userId: event.userId,
          profileUrl: user.profileUrl,
          nickname: user.nickname,
        );
    }

    return const SizedBox.shrink();
  }

  /// 사용자 ID로 사용자 정보 찾기
  UserEntity? _findUserById(String userId) {
    try {
      return _users.firstWhere((user) => user.id.toString() == userId);
    } catch (e) {
      return null;
    }
  }

  /// 연속된 메시지를 그룹화하는 함수
  /// 같은 사용자가 동일 분 단위 내에 보낸 메시지들을 그룹으로 묶음
  List<List<InChatEventEntity>> _groupConsecutiveMessages(
    List<InChatEventEntity> events,
  ) {
    if (events.isEmpty) return [];

    final List<List<InChatEventEntity>> groups = [];
    List<InChatEventEntity> currentGroup = [events.first];

    for (int i = 1; i < events.length; i++) {
      final currentEvent = events[i];
      final previousEvent = events[i - 1];

      final isChatNow = currentEvent.inChatEventType == InChatEventType.CHAT;
      final isChatOutNow =
          currentEvent.inChatEventType == InChatEventType.CHAT_OUT;

      /// 연속적인 채팅과 CHAT_OUT을 그룹화 해주기 위함
      /// OR연산으로 해도 될 듯. 둘 다 한번에 참일 수는 없음
      if (isChatNow || isChatOutNow) {
        if (_checkConsecutiveChat(currentEvent, previousEvent) ||
            _checkConsecutiveChatOut(currentEvent, previousEvent)) {
          /// 같은 그룹으로
          currentGroup.insert(0, currentEvent);
        } else {
          /// 다른 그룹으로 처리
          groups.add(List.from(currentGroup));
          currentGroup = [currentEvent];
        }
      } else {
        /// 다른 그룹으로 처리
        groups.add(List.from(currentGroup));
        currentGroup = [currentEvent];
      }
    }

    /// 마지막 그룹 추가
    if (currentGroup.isNotEmpty) {
      groups.add(currentGroup);
    }

    return groups;
  }

  /// 같은 사용자의 같은 분 내 CHAT 타입 메시지인지 확인
  bool _checkConsecutiveChat(
    InChatEventEntity currentEvent,
    InChatEventEntity previousEvent,
  ) {
    final sameUser = currentEvent.userId == previousEvent.userId;
    final sameMinute = _isSameMinute(
      currentEvent.timeStamp,
      previousEvent.timeStamp,
    );
    final bothChatType =
        currentEvent.inChatEventType == InChatEventType.CHAT &&
        previousEvent.inChatEventType == InChatEventType.CHAT;

    return sameUser && sameMinute && bothChatType;
  }

  /// 유저가 CHAT_OUT을 통해 나감
  bool _checkConsecutiveChatOut(
    InChatEventEntity currentEvent,
    InChatEventEntity previousEvent,
  ) {
    final bothChatOut =
        currentEvent.inChatEventType == InChatEventType.CHAT_OUT &&
        previousEvent.inChatEventType == InChatEventType.CHAT_OUT;
    return bothChatOut;
  }

  /// 두 시간이 같은 분 단위인지 확인
  bool _isSameMinute(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day &&
        a.hour == b.hour &&
        a.minute == b.minute;
  }

  /// 두 날짜가 다른지 확인하고 필요한 경우 날짜 구분선을 생성할지 결정하는 유틸리티 함수
  bool _shouldShowDateDivider(
    List<InChatEventEntity> currentGroup,
    List<InChatEventEntity> previousGroup,
  ) {
    if (currentGroup.isEmpty || previousGroup.isEmpty) return false;

    final currentDate = currentGroup.first.timeStamp;
    final prevDate = previousGroup.first.timeStamp;

    return currentDate.year != prevDate.year ||
        currentDate.month != prevDate.month ||
        currentDate.day != prevDate.day;
  }
}
