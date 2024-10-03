import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/dm/dm_provider.dart';
import 'package:sottie_flutter/ui/chat/widget/dm_chat_room.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class DmContentScreen extends ConsumerWidget {
  const DmContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dmState = ref.watch(dmStateProvider);

    return dmState.when(
      data: (data) {
        return ListView(
          children: data.map((e) => DmChatRoom(model: e)).toList(),
        );
      },
      error: (_, __) {
        return const Center(
          child: Text("데이터를 가져올 수 없습니다."),
        );
      },
      loading: () => const LoadingSkeleton(),
    );
  }
}
