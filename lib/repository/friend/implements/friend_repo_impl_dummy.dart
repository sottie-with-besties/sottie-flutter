import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

final class FriendRepoImplDummy implements FriendRepository {
  @override
  Future<List<UserModel>> getFriends() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      UserModel(
        id: 101,
        nickname: '더미친구1',
        stateMsg: '더미 친구 상태메시지 1',
        profileUrl: 'dummy_friend_profile_1',
        mannerTemperature: 36.5,
      ),
      UserModel(
        id: 102,
        nickname: '더미친구2',
        stateMsg: '더미 친구 상태메시지 2',
        profileUrl: 'dummy_friend_profile_2',
        mannerTemperature: 37.2,
      ),
      UserModel(
        id: 103,
        nickname: '더미친구3',
        stateMsg: '더미 친구 상태메시지 3',
        profileUrl: null,
        mannerTemperature: 38.1,
      ),
      UserModel(
        id: 104,
        nickname: '더미친구4',
        stateMsg: null,
        profileUrl: 'dummy_friend_profile_4',
        mannerTemperature: 36.9,
      ),
      UserModel(
        id: 105,
        nickname: '더미친구5',
        stateMsg: '더미 친구 상태메시지 5',
        profileUrl: 'dummy_friend_profile_5',
        mannerTemperature: 39.5,
      ),
      UserModel(
        id: 106,
        nickname: '더미친구6',
        stateMsg: '더미 친구 상태메시지 6',
        profileUrl: null,
        mannerTemperature: 40.2,
      ),
      UserModel(
        id: 107,
        nickname: '더미친구7',
        stateMsg: '더미 친구 상태메시지 7',
        profileUrl: 'dummy_friend_profile_7',
        mannerTemperature: 37.8,
      ),
    ];
  }

  @override
  Future<List<UserModel>> getFriendRequests() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      UserModel(
        id: 201,
        nickname: '더미요청1',
        stateMsg: '더미 친구 요청 상태메시지 1',
        profileUrl: 'dummy_request_profile_1',
        mannerTemperature: 35.8,
      ),
      UserModel(
        id: 202,
        nickname: '더미요청2',
        stateMsg: '더미 친구 요청 상태메시지 2',
        profileUrl: null,
        mannerTemperature: 36.3,
      ),
      UserModel(
        id: 203,
        nickname: '더미요청3',
        stateMsg: null,
        profileUrl: 'dummy_request_profile_3',
        mannerTemperature: 37.4,
      ),
    ];
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
