import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
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
  final _scrollController = ScrollController(
    keepScrollOffset: false,
  );

  // didChangeMetrics
  double _viewInsetsBottom = 0;

  /// 최근 채팅이 보이도록 채팅방 입장하기
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
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
    const opponentStyle = TextStyle(color: Colors.black);
    const myStyle = TextStyle(color: mainSilverColor);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          children: [
            renderDmChatBox(
              [
                const Text(
                  "안녕하세요.",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "반갑습니다.",
                  style: myStyle,
                ),
              ],
              true,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "어디서 만날까요?",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "어디서 만날까요?",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "어디서 만날까요?",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "수원에서 뵈요.",
                  style: myStyle,
                ),
              ],
              true,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "넵.",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "넵.",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "넵.",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
            renderDmChatBox(
              [
                const Text(
                  "ㅁㄴ아ㅣ;러마ㅣ;ㅓ라ㅣ;ㅁㄴㅁㄴ이ㅏ;러ㅏㅣㅁ;어라ㅣ;ㅁㄴ어ㅏㅣ럼나ㅣ;러ㅏㅣㅁ너라ㅣ;ㅁㄴ어ㅑㅐㄹㅁ너댜ㅐ렂댜ㅐㅣ러ㅑㅐㅁㄴ어ㅑㅐ리;ㅁㄴ어ㅑㅐㅣㄹ머냐ㅐㅇ러ㅑㅐㅁㄴ어ㅑㅐㄹㅁㄴ어ㅑㅐㄹㅁ너ㅑ애러ㅐㅑ;ㅁ어랴ㅐ;ㅁ너ㅑㅐㄹ;ㅁㄴ어ㅑㅐ;ㄹㅁ너ㅑㅐ;ㅇ러ㅑㅐㅁㄴ;러ㅑㅐ;멍랴ㅐ;ㅁㄴ어ㅑㅐ;럼냐ㅐ;러ㅑㅐㅁㄴ러ㅑㅐㅔ;머ㅑㅐㄹ;ㅁ",
                  style: opponentStyle,
                ),
              ],
              false,
              widget.avatarId,
            ),
          ],
        ),
      ),
    );
  }
}

Widget renderDmChatBox(List<Widget> contents, bool myMsg, String? avatarId) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
              myMsg ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!myMsg)
              UserProfile(
                avatarId: avatarId,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contents,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
