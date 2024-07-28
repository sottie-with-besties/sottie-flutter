import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/services/friend/friend_service.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';

class FriendListScreen extends ConsumerStatefulWidget {
  const FriendListScreen({super.key});

  @override
  ConsumerState<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends ConsumerState<FriendListScreen> {

  List<Friend> friendList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    friendList = await FriendService().getFriends('8');

    log('friends $friendList', name: 'getData friendList');
    setState(() {});
  }

  List<Friend> filterList(String inputText) {
    return friendList.where((Friend data) {
        log(data.toString(), name: 'where');
        return data.friendInfo['friendName'].toString().contains(inputText);
      }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final inputText = ref.watch(friendHeaderControllerProvider);
    final friendFilterList = filterList(inputText).map((friend) {
      log(friend.toString(), name: 'map');

      return Friend(key:friend.key , friendInfo: friend.friendInfo);
    }).toList();

    return SlidableAutoCloseBehavior(child: Column(children: friendFilterList));
  }

}
