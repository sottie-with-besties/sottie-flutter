import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_content_screen.dart';
import 'package:sottie_flutter/ui/common/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasScrollBody: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: AppBarTitle(
          title: '채팅',
        ),
      ),
      contentChild: ChatContentScreen(),
    );
  }
}
