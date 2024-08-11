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
  // List<Friend> friendList = [];
  late Future<List<Map<String, dynamic>>> friendList;

  @override
  void initState() {
    super.initState();
    // getData();
    friendList = getFriendDummy();
  }

  // 연식님 코드
  // void getData() async {
  //   friendList = await FriendService().getFriends('8');
  //
  //   log('friends $friendList', name: 'getData friendList');
  //   setState(() {});
  // }
  //
  // List<Friend> filterList(String inputText) {
  //   return friendList.where((Friend data) {
  //       log(data.toString(), name: 'where');
  //       return data.friendInfo['friendName'].toString().contains(inputText);
  //     }).toList();
  //
  // }

  @override
  Widget build(BuildContext context) {
    final inputText = ref.watch(friendHeaderControllerProvider);
    // 연식님 코드
    //   final friendFilterList = filterList(inputText).map((friend) {
    //     log(friend.toString(), name: 'map');

    //     return Friend(key:friend.key , friendInfo: friend.friendInfo);
    //   }).toList();

    //   return SlidableAutoCloseBehavior(child: Column(children: friendFilterList));
    // }

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
