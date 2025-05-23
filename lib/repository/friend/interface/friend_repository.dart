import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_repo_impl_dev.dart';

abstract interface class FriendRepository {
  factory FriendRepository() {
    return FriendRepoImplDev();
  }

  /// 친구 데이터 불러오기
  Future<List<UserModel>> getFriends();

  /// 친구 요청 데이터 불러오기
  Future<List<UserModel>> getFriendRequests();
}
