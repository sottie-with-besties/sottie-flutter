import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_tab_view.dart.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_header.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';

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
        appBarTitle: '채팅',
        header: ChatHeader(focusNode: focusNode),
        contentChild: const ChatTabView(),
      ),
    );
  }
}
