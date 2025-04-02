import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/provider/chat/dm_provider.dart';
import 'package:sottie_flutter/ui/chat/controller/chat_header_controller.dart';
import 'package:sottie_flutter/ui/chat/widget/dm_chat_room.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class DmScreen extends ConsumerWidget {
  const DmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dmState = ref.watch(dmStateProvider);
    final inputText = ref.watch(chatHeaderControllerProvider);

    return dmState.when(
      data: (data) {
        final dmList = data.where((data) {
          final searched =
              data.userDTO.nickname.toString().contains(inputText) ||
              data.latestMsg.toString().contains(inputText);

          return searched;
        });

        if (dmList.isEmpty) {
          return const Center(child: Text("채팅방이 존재하지 않습니다"));
        }

        return ListView(
          children: dmList.map((e) => DmChatRoom(entity: e)).toList(),
        );
      },
      error: (_, __) {
        return const Center(child: Text("데이터를 가져올 수 없습니다."));
      },
      loading: () => const LoadingSkeleton(),
    );
  }
}
