import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/provider/friend/friend_provider.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';

class FriendListScreen extends ConsumerWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendState = ref.watch(friendStateProvider);
    final inputText = ref.watch(friendHeaderControllerProvider);

    return friendState.when(
      data: (data) {
        final friendList = data.where(
          (data) => data.nickname.toString().contains(inputText),
        );

        if (friendList.isEmpty) {
          return const Center(child: Text("모임에 참여하고 친구를 만들어보세요"));
        }

        return Column(
          children:
              friendList.map<Widget>((data) => Friend(model: data)).toList(),
        );
      },
      error: (_, __) => const Center(child: Text("친구를 불러오는 도중 에러가 발생했습니다")),
      loading: () => const LoadingSkeleton(),
    );
  }
}
