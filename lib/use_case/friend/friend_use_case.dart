import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

sealed class FriendUseCase {
  static final _repo = FriendRepository();

  /// 친구 데이터 불러오기
  static Future<List<UserModel>> getFriendsList() async {
    final friendList = await _repo.getFriends();

    return friendList;
  }

  /// 친구 요청 데이터 불러오기
  static Future<List<UserModel>> getFriendRequestsList() async {
    final friendRequestList = await _repo.getFriendRequests();

    return friendRequestList;
  }

  /// 친구 추가
  static void friendAdd(BuildContext context) {
    log("friendAdd");
  }

  /// 친구 삭제
  static void friendDelete(BuildContext context) {
    log("friendDelete");
  }

  /// 친구 DM 전송
  static void friendSendDm(BuildContext context) {
    log("friendSendDm");
  }
}
