import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

final class FriendRepoImplDev implements FriendRepository {
  @override
  Future<List<UserModel>> getFriends() async {
    // Todo: RestApi 코드 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }

  @override
  Future<List<UserModel>> getFriendRequests() async {
    // Todo: RestApi 코드 작성
    await Future.delayed(const Duration(seconds: 1), null);
    return [];
  }

  @override
  Future<bool> acceptFriendRequest(String userId) {
    // TODO: implement acceptFriendRequest
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteFriend(String userId) {
    // TODO: implement deleteFriend
    throw UnimplementedError();
  }

  @override
  Future<bool> rejectFriendRequest(String userId) {
    // TODO: implement rejectFriendRequest
    throw UnimplementedError();
  }
}
