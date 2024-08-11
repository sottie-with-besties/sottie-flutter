import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/data/user/data_source/friend_dummy.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';

class FriendListScreen extends ConsumerStatefulWidget {
  const FriendListScreen({super.key});

  @override
  ConsumerState<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends ConsumerState<FriendListScreen> {
  late Future<List<Map<String, dynamic>>> friendList;

  @override
  void initState() {
    super.initState();
    friendList = getFriendDummy();
  }

  @override
  Widget build(BuildContext context) {
    final inputText = ref.watch(friendHeaderControllerProvider);

    return FutureBuilder(
      future: friendList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingSkeleton();
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("모임에 참여하세요!"),
          );
        } else if (snapshot.hasData) {
          final friendList = snapshot.data!
              .where((Map<String, dynamic> data) =>
                  data['nickname'].toString().contains(inputText))
              .map((Map<String, dynamic> data) => Friend(friendInfo: data))
              .toList();

          return SlidableAutoCloseBehavior(child: Column(children: friendList));
        } else {
          return const Center(
            child: Text("에러가 발생했습니다"),
          );
        }
      },
    );
  }
}
