import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/in_chat/data_source/in_chat_message_dummy.dart';
import 'package:sottie_flutter/data/in_chat/model/in_chat_message_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class InChatBox extends StatefulWidget {
  const InChatBox({
    super.key,
    this.avatarId,
  });

  final String? avatarId;

  @override
  State<InChatBox> createState() => _InChatBoxState();
}

class _InChatBoxState extends State<InChatBox> with WidgetsBindingObserver {
  // didChangeMetrics
  double _viewInsetsBottom = 0;

  /// 첫 입장 했을때 스크롤 맨 아래로 내리기. True로 바꾸어 한번만 동작하게 한다.
  bool firstEnter = false;

  final _scrollController = ScrollController(
    keepScrollOffset: false,
  );

  Widget _renderDmChatBox(InChatMessageDataModel model) {
    final myMsg = model.userIdWhoSent == '12345';

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Align(
            alignment: myMsg ? Alignment.centerRight : Alignment.centerLeft,
            child: Column(
              crossAxisAlignment:
                  myMsg ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!myMsg)
                      UserProfile(
                        avatarId: model.userIdWhoSent,
                        randomAvatarSize: 30,
                      ),
                    const SizedBox(width: 15),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150 * hu,
                        maxWidth: 150 * wu,
                      ),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: myMsg ? Colors.blueAccent : mainSilverColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            model.entity.entity,
                            style: TextStyle(
                              color: myMsg ? mainSilverColor : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Transform.translate(
                  offset: Offset(myMsg ? 12 * wu : 0, 0),
                  child: Text(
                    renderCustomStringTime(
                      model.sentTime,
                      model.sentTime,
                    ),
                    style: const TextStyle(
                      color: mainSilverColor,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

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
  @override
  void didChangeMetrics() {
    /// 최근 채팅이 보이도록 채팅방 입장하기
    if (_scrollController.hasClients && !firstEnter) {
      firstEnter = true;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }

    final bottom = View.of(context).viewInsets.bottom;

    if (_viewInsetsBottom != bottom) {
      _viewInsetsBottom = bottom;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

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
                backgroundColor: mainSilverColor,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "채팅을 불러오고 있습니다...",
              style: TextStyle(
                color: mainSilverColor,
              ),
            )
          ],
        ),
      ),
      callBack: (futureData) {
        final data = futureData as InChatMessageModel;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),

            /// ListView.builder => 메모리 동적 해제
            child: ListView.builder(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              itemCount: data.inChatMessageData.length,
              itemBuilder: (_, index) =>
                  _renderDmChatBox(data.inChatMessageData[index]),
            ),
          ),
        );
      },
    );
  }
}
