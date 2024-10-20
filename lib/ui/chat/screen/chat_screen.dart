import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_tab_view.dart.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: DefaultLayout(
        hasScrollBody: true,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: AppBarTitle(
            title: '채팅',
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LocalTextField(
            hint: "제목, 날짜, 장소...",
            focusNode: focusNode,
            enabledBorder: false,
            focusBorder: false,
          ),
        ),
        contentChild: const ChatTabView(),
      ),
    );
  }
}
