import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_photo.dart';

class InChatPhotoListScreen extends StatelessWidget {
  const InChatPhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("사진, 동영상"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) => const InChatPhoto(),
          itemCount: 15, // 예시로 8개의 아이템을 생성합니다.
        ),
      ),
    );
  }
}
