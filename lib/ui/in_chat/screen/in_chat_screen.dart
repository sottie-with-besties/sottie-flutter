import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_box.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_type_box.dart';

class InChatScreen extends StatefulWidget {
  const InChatScreen({
    super.key,
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  State<InChatScreen> createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        endDrawer: const Drawer(),
        body: Column(
          children: [
            const InChatBox(avatarId: "123"),
            InChatTypeBox(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}
