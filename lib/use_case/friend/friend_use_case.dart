import 'dart:developer';

import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

sealed class FriendUseCase {
  static final _repo = FriendRepository();

  /// 친구 데이터 불러오기
  static Future<List<UserModel>> getFriendsList() async {
    try {
      final friendList = await _repo.getFriends();
      return friendList;
    } catch (e) {
      log("Error fetching friend list: $e");
      return [];
    }
  }

  /// 친구 요청 데이터 불러오기
  static Future<List<UserModel>> getFriendRequestsList() async {
    try {
      final friendRequestList = await _repo.getFriendRequests();
      return friendRequestList;
    } catch (e) {
      log("Error fetching friend requests list: $e");
      return [];
    }
  }

  /// 친구 삭제
  static Future<bool> deleteFriend(String userId) async {
    try {
      await _repo.deleteFriend(userId);
      log("Friend deleted: $userId");
      return true;
    } catch (e) {
      log("Error deleting friend: $e");
      return false;
    }
  }

  /// 친구 요청 수락
  static Future<bool> acceptFriendRequest(String userId) async {
    try {
      await _repo.acceptFriendRequest(userId);
      log("Friend request accepted: $userId");
      return true;
    } catch (e) {
      log("Error accepting friend request: $e");
      return false;
    }
  }

  /// 친구 요청 거절
  static Future<bool> rejectFriendRequest(String userId) async {
    try {
      await _repo.rejectFriendRequest(userId);
      log("Friend request rejected: $userId");
      return true;
    } catch (e) {
      log("Error rejecting friend request: $e");
      return false;
    }
  }
}
