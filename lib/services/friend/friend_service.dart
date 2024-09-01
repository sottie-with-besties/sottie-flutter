import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/dio/dio_api.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/ui/friend/widget/friend.dart';

class FriendService {
  Future<List<Friend>> getFriends(String userId, {String? alias}) async {
    final friends =
        await DioApi.call(path: '/sottie/friends/$userId', method: 'GET');

    log('friends $friends', name: 'getFriends');

    return friends.map<Friend>((data) {
      return Friend(
        key: UniqueKey(),
        model: FriendModel(
          id: data['userId'],
          nickname: data['alias'],
          stateMsg: data['stateMsg'],
        ),
      );
    }).toList();
  }
}
