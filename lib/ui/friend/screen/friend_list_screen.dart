import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';

class FriendListScreen extends ConsumerWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputText = ref.watch(friendHeaderControllerProvider);
    final friendList = _dummy.where((Map<String, Object> data) {
      log(data.toString(), name: 'where');
      return data['friendName'].toString().contains(inputText);
    }).map((Map<String, Object> data) {
      log(data.toString(), name: 'map');

      return Friend(friendInfo: data);
    }).toList();

    return SlidableAutoCloseBehavior(child: Column(children: friendList));
  }
}

const _dummy = [
  {
    'friendName': 'abcd',
    'stateMsg': '카페에서 커피한잔~',
    'mannerPoint': 87.5,
    'id': '0',
  },
  {
    'friendName': 'test',
    'stateMsg': '아침 모임',
    'mannerPoint': 100.0,
    'id': '1',
  },
  {
    'friendName': 'test',
    'stateMsg': '저녁 모임',
    'mannerPoint': 99.5,
    'id': '2',
  },
  {
    'friendName': 'hhhh',
    'stateMsg': '점심 모임',
    'mannerPoint': 41.5,
    'id': '3',
  },
  {
    'friendName': 'test',
    'stateMsg': '조찬 모임',
    'mannerPoint': 87.0,
    'id': '4',
  },
  {
    'friendName': 'test',
    'stateMsg': '오후 커피 타임',
    'mannerPoint': 39.5,
    'id': '5',
  },
  {
    'friendName': 'test',
    'stateMsg': '야간 모임',
    'mannerPoint': 44.7,
    'id': '6',
  },
];
