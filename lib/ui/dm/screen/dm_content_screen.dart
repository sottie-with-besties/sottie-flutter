import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';
import 'package:sottie_flutter/domain/dm/dm_provider.dart';
import 'package:sottie_flutter/ui/dm/widget/dm_chat_room.dart';

class DmContentScreen extends StatefulWidget {
  const DmContentScreen({super.key});

  @override
  State<DmContentScreen> createState() => _DmContentScreenState();
}

class _DmContentScreenState extends State<DmContentScreen> {
  late Future<List<DmModel>> dmList;

  @override
  void initState() {
    super.initState();
    dmList = DmProvider().getDm();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dmList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainBrownColor,
            ),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("모임에 참여하세요!"),
          );
        } else if (snapshot.hasData) {
          final chatRooms =
              snapshot.data!.map((e) => DmChatRoom(model: e)).toList();
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
