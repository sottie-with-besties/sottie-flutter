import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/dm/widget/dm_chat_room.dart';

class DmContentScreen extends StatelessWidget {
  const DmContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DmChatRoom(name: "이한솔", latestMsg: "안녕하세요!"),
        DmChatRoom(
          name: "김연식",
          latestMsg: "반갑습니다!",
        ),
      ],
    );
  }
}
