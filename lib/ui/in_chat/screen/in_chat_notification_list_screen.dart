import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_notification.dart';

class InChatNotificationListScreen extends StatelessWidget {
  const InChatNotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("공지사항")),
      body: const Column(
        children: [
          InChatNotification(),
          InChatNotification(),
          InChatNotification(),
          InChatNotification(),
          InChatNotification(),
          InChatNotification(),
        ],
      ),
    );
  }
}
