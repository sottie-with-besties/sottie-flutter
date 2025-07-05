import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_repo_impl_dummy.dart';

abstract interface class FriendRepository {
  factory FriendRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => FriendRepoImplDummy(),
      ServerEnvironment.dev => FriendRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  /// 친구 데이터 불러오기
  Future<List<UserModel>> getFriends();

  /// 친구 요청 데이터 불러오기
  Future<List<UserModel>> getFriendRequests();

  /// 친구 삭제
  Future<void> deleteFriend(String userId);

  /// 친구 요청 수락
  Future<void> acceptFriendRequest(String userId);

  /// 친구 요청 거절
  Future<void> rejectFriendRequest(String userId);
}
