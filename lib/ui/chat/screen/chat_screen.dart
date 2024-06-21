import 'package:flutter/material.dart';

import '../../../core/constant/custom_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ChatScreen",
        style: TextStyle(color: mainSilverColor),
      ),
    );
  }
}
