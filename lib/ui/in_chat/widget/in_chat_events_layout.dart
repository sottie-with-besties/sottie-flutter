import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/in_chat/model/in_chat_event_model.dart';
import 'package:sottie_flutter/data/in_chat/repository_impl/in_chat_message_dummy.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/chat_room_destroying_timer.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class InChatEventsLayout extends StatelessWidget {
  const InChatEventsLayout({
    super.key,
    required this.isChattingOver,
    required this.date,
  });

  final bool isChattingOver;
  final DateTime date; // 모임 날짜

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      futureFunction: getInChatMessageDummy,
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
      callBack: (futureData) {
        final data = futureData as InChatEventListModel;

        return _EventsList(
          model: data,
          isChattingOver: isChattingOver,
          date: date,
        );
      },
    );
  }
}

class _EventsList extends StatefulWidget {
  const _EventsList({
    required this.model,
    required this.isChattingOver,
    required this.date,
  });

  final InChatEventListModel model;
  final bool isChattingOver;
  final DateTime date; // 모임 날짜

  @override
  State<_EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<_EventsList> with WidgetsBindingObserver {
  // didChangeMetrics
  double _viewInsetsBottom = 0;

  /// 첫 입장 했을때 스크롤 맨 아래로 내리기. True로 바꾸어 한번만 동작하게 한다.
  bool firstEnter = false;

  /// 채팅방에 날짜 표시하기 위한 보조 변수 => Todo: 초기화를 채팅이 생성된 시점으로 추후 변경하기
  DateTime latestSentTime = DateTime(2024, 10, 10).toLocal();

  final _scrollController = ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  /// 키보드가 올라왔을 때 채팅창 스크롤을 맨 아래로 내려서 마지막 대화내용이 보일 수 있도록 한다.
  /// if문의 _viewInsetsBottom(이전의 바텀 뷰 인셋) != bottom(현재 바텀 뷰 인셋) 조건은
  /// 키보드가 올라오는 중 및 내려가는 중을 의미하는 것이며 그 이외에는 유저가 스크롤 할 수 있게 한다.
  /// ListView의 reverse를 true로 하면 맨 아래가 포지션 값이 0이 된다.
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

        /// ListView.builder => 메모리 동적 해제
        child: ListView.builder(
          reverse: true,
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.model.inChatEventList.length + 1,
          cacheExtent: widget.model.inChatEventList.length.toDouble() * 100,
          itemBuilder: (_, index) {
            if (index == widget.model.inChatEventList.length) {
              Duration? du;

              final gatheringDate = widget.date.toLocal();

              final now = DateTime.now().toLocal();
              du = now.difference(gatheringDate);

              /// DM은 widget.isChattingOver가 무조건 falsed이다.
              return widget.isChattingOver
                  ? Padding(
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
                          const SizedBox(height: 10),
                          ChatRoomDestroyingTimer(
                            key: UniqueKey(),
                            timeLeft: du,
                          ),
                        ],
                      ),
                    ),
                  )
                  : Container();
            } else {
              /// 날짜 구분 ui 코드
              final sentTime = widget.model.inChatEventList[index].timeStamp;
              final dateSentTime = sentTime.toLocal();

              final isAnotherDay = latestSentTime.day != dateSentTime.day;
              latestSentTime = dateSentTime;

              return Column(
                children: [
                  if (index == 0)
                    Column(
                      children: [
                        _renderSentTime(DateTime(2024, 9, 13)),
                        Container(
                          decoration: BoxDecoration(
                            color: mainBlueColor.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Text(
                            textAlign: TextAlign.center,
                            '채팅이 시작되었습니다.',
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                  /// ListView.builder의 특성으로 인해 메모리에서 해제 되면 날짜도 사라진다.
                  /// 위로 올릴 때 날짜의 차이가 -1이 된다.
                  if (isAnotherDay) _renderSentTime(latestSentTime),
                  _renderDmChatBox(widget.model.inChatEventList[index]),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _renderSentTime(DateTime sentTime) {
  final sentTimeString =
      "${sentTime.month}월 ${sentTime.day}일 ${convertIntToWeekday(sentTime.weekday)}";

  return Padding(
    padding: EdgeInsets.only(bottom: 16 * hu),
    child: Container(
      decoration: BoxDecoration(
        color: mainGreenColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(sentTimeString),
    ),
  );
}

Widget _renderDmChatBox(InChatEventModel model) {
  /// 내가 보낸 메세지이면 true
  /// 추후 내 정보의 id와 바꾸는 코드로 변경해야 함
  final myMsg = model.userId == 12345;

  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
              myMsg ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!myMsg) const UserProfile(),
            if (!myMsg) const SizedBox(width: 15),
            Column(
              crossAxisAlignment:
                  myMsg ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                // ...model.entity.map((entityData) {
                //   return Padding(
                //     padding: const EdgeInsets.only(bottom: 8),
                //     child: ConstrainedBox(
                //       constraints: BoxConstraints(
                //         maxHeight: 150 * hu,
                //         maxWidth: 150 * wu,
                //       ),
                //       child: SingleChildScrollView(
                //         physics: const ClampingScrollPhysics(),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: myMsg ? mainBlueColor : mainWhiteSilverColor,
                //             borderRadius: BorderRadius.circular(5),
                //             border: myMsg ? null : Border.all(width: 0.5),
                //           ),
                //           padding: const EdgeInsets.all(12),
                //           child: Text(
                //             entityData.entity,
                //             style: TextStyle(
                //               color:
                //                   myMsg ? mainWhiteSilverColor : Colors.black,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   );
                // }),
                // const SizedBox(height: 5),
                // Text(
                //   renderCustomStringTime(model.inChatData, model.sentTime),
                //   style: TextStyle(fontSize: 8 * hu),
                // ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    ),
  );
}
