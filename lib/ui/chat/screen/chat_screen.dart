import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_content_screen.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: DefaultLayout(
        hasScrollBody: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AppBarTitle(
            title: '채팅',
          ),
        ),
        header: LocalTextField(
          hint: "제목, 날짜, 장소...",
          focusNode: focusNode,
        ),
        contentChild: ChatContentScreen(),
      ),
    );
  }
}
