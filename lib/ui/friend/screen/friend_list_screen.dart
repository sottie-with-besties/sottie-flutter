import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/data/friend/data_source/friend_dummy.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';

class FriendListScreen extends ConsumerStatefulWidget {
  const FriendListScreen({super.key});

  @override
  ConsumerState<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends ConsumerState<FriendListScreen> {
  // List<Friend> friendList = [];

  @override
  void initState() {
    super.initState();
    // getData();
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

    return CustomFutureBuilder(
      futureFunction: getFriendDummy,
      callBack: (futureData) {
        final friendList = futureData
            .where((FriendModel data) =>
                data.nickname.toString().contains(inputText))
            .map<Widget>((FriendModel data) => Friend(model: data))
            .toList();

        return SlidableAutoCloseBehavior(child: Column(children: friendList));
      },
      notHasData: const Text("모임에 참여하고 친구를 만들어보세요."),
    );
  }
}
