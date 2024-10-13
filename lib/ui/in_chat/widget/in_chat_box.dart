import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/in_chat/data_source/in_chat_message_dummy.dart';
import 'package:sottie_flutter/data/in_chat/model/in_chat_message_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class InChatBox extends StatelessWidget {
  const InChatBox({
    super.key,
    this.avatarId,
  });

  final String? avatarId;

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
                backgroundColor: mainWhiteSilverColor,
                color: mainBlueColor,
                borderRadius: BorderRadius.circular(8),
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "채팅을 불러오고 있습니다...",
              style: TextStyle(
                color: mainWhiteSilverColor,
              ),
            )
          ],
        ),
      ),
      callBack: (futureData) {
        final data = futureData as InChatMessageModel;

        return _ChatBox(model: data);
      },
    );
  }
}

class _ChatBox extends StatefulWidget {
  const _ChatBox({
    required this.model,
  });

  final InChatMessageModel model;

  @override
  State<_ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<_ChatBox> with WidgetsBindingObserver {
  // didChangeMetrics
  double _viewInsetsBottom = 0;

  /// 첫 입장 했을때 스크롤 맨 아래로 내리기. True로 바꾸어 한번만 동작하게 한다.
  bool firstEnter = false;

  final _scrollController = ScrollController(
    keepScrollOffset: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// 최근 채팅이 보이도록 채팅방 입장하기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent - 50 * hu);
      }
    });
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
    final bottom = View.of(context).viewInsets.bottom;

    if (_viewInsetsBottom != bottom) {
      _viewInsetsBottom = bottom;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),

        /// ListView.builder => 메모리 동적 해제
        child: ListView.builder(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.model.inChatMessageData.length,
          itemBuilder: (_, index) =>
              _renderDmChatBox(widget.model.inChatMessageData[index]),
        ),
      ),
    );
  }
}

Widget _renderDmChatBox(InChatMessageDataModel model) {
  /// 내가 보낸 메세지이면 true
  /// 추후 내 정보의 id와 바꾸는 코드로 변경해야 함
  final myMsg = model.userIdWhoSent == '12345';

  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
              myMsg ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!myMsg)
              UserProfile(
                profileUrl: model.userIdWhoSent,
                randomAvatarSize: 30,
              ),
            if (!myMsg) const SizedBox(width: 15),
            Column(
              crossAxisAlignment:
                  myMsg ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                ...model.entity.map(
                  (entityData) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 150 * hu,
                          maxWidth: 150 * wu,
                        ),
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  myMsg ? mainBlueColor : mainWhiteSilverColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              entityData.entity,
                              style: TextStyle(
                                color:
                                    myMsg ? mainWhiteSilverColor : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  renderCustomStringTime(
                    model.sentTime,
                    model.sentTime,
                  ),
                  style: const TextStyle(
                    color: mainWhiteSilverColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    ),
  );
}
