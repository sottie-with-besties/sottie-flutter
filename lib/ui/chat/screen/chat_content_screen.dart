import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/domain/chat/chat_provider.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class ChatContentScreen extends StatefulWidget {
  const ChatContentScreen({super.key});

  @override
  State<ChatContentScreen> createState() => _ChatContentScreenState();
}

class _ChatContentScreenState extends State<ChatContentScreen> {
  late Future<List<ChatRoomModel>> chatList;

  @override
  void initState() {
    super.initState();
    chatList = ChatProvider().getChatRoom();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chatList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingSkeleton();
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("모임에 참여하세요!"),
          );
        } else if (snapshot.hasData) {
          final chatRooms =
              snapshot.data!.map((e) => ChatRoom(model: e)).toList();
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: chatRooms,
            ),
          );
        } else {
          return const Center(
            child: Text("에러가 발생했습니다"),
          );
        }
      },
    );
  }
}
