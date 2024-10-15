import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_box.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_drawer.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_type_box.dart';

class InChatScreen extends StatefulWidget {
  const InChatScreen({
    super.key,
    required this.id,
    required this.title,
    required this.isGenerated,
  });

  final String id;
  final String title;
  final bool isGenerated;

  @override
  State<InChatScreen> createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(color: mainWhiteSilverColor),
          ),
          backgroundColor: mainBlueColor,
          iconTheme: const IconThemeData(color: mainWhiteSilverColor),
        ),
        backgroundColor: mainWhiteSilverColor,
        endDrawer: const InChatDrawer(),
        body: widget.isGenerated
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InChatBox(avatarId: "123"),
                  InChatTypeBox(focusNode: _focusNode),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white54,
                      ),
                      width: 200 * wu,
                      height: 50 * hu,
                      child: const Center(child: Text("인원이 모두 모이면 채팅이 시작됩니다.")),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
