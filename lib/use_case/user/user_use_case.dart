import 'dart:developer';

import 'package:sottie_flutter/model/user/my_info_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/user/interface/user_repository.dart';

sealed class UserUseCase {
  static final _repo = UserRepository();

  // 내 정보 가져오기
  static Future<MyInfoModel?> getMyInfo() async {
    try {
      final myInfo = await _repo.getMyInfo();
      return myInfo;
    } catch (e) {
      log("Error fetching my info: $e");
      return null;
    }
  }

  // 내 정보 업데이트하기
  static Future<bool> updateMyInfo(MyInfoModel myInfo) async {
    try {
      await _repo.updateMyInfo(myInfo: myInfo);
      log("My info updated");
      return true;
    } catch (e) {
      log("Error updating my info: $e");
      return false;
    }
  }

  // 사용자 검색하기
  static Future<List<UserModel>> searchUser(String searchText) async {
    try {
      final users = await _repo.searchUser(searchText: searchText);
      return users;
    } catch (e) {
      log("Error searching user: $e");
      return [];
    }
  }

  // 친구 추가하기
  static Future<bool> addFriend(String userId) async {
    try {
      await _repo.addFriend(userId: userId);
      log("Friend added: $userId");
      return true;
    } catch (e) {
      log("Error adding friend: $e");
      return false;
    }
  }

  // 차단한 사용자 목록 가져오기
  static Future<List<UserModel>> getBlockedUsers() async {
    try {
      final blockedUsers = await _repo.getBlockedUsers();
      return blockedUsers;
    } catch (e) {
      log("Error getting blocked users: $e");
      return [];
    }
  }

  // 사용자 차단하기
  static Future<bool> userBlock(String userId) async {
    try {
      await _repo.blockUser(userId: userId);
      log("User blocked: $userId");
      return true;
    } catch (e) {
      log("Error blocking user: $e");
      return false;
    }
  }

  // 사용자 차단 해제하기
  static Future<bool> userUnblock(String userId) async {
    try {
      await _repo.unblockUser(userId: userId);
      log("User unblocked: $userId");
      return true;
    } catch (e) {
      log("Error unblocking user: $e");
      return false;
    }
  }

  // 사용자 신고하기
  static Future<bool> userReport(String userId) async {
    try {
      await _repo.reportUser(userId: userId);
      log("User reported: $userId");
      return true;
    } catch (e) {
      log("Error reporting user: $e");
      return false;
    }
  }
}
