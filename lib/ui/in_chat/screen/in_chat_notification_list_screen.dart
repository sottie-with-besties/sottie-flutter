import 'package:flutter/material.dart';

class InChatNotificationListScreen extends StatelessWidget {
  const InChatNotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항"),
      ),
      body: const Center(
        child: Text("공지사항"),
      ),
    );
  }
}
