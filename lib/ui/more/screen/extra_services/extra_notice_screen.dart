import 'package:flutter/material.dart';

class ExtraNoticeScreen extends StatelessWidget {
  const ExtraNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항"),
      ),
      body: Column(
        children: [
          Text("Notice"),
        ],
      ),
    );
  }
}
