import 'package:sottie_flutter/model/user/my_info_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/user/interface/user_repository.dart';

final class UserRepoImplDummy implements UserRepository {
  @override
  Future<MyInfoModel> getMyInfo() {
    // TODO: implement getMyInfo
    throw UnimplementedError();
  }

  @override
  Future<bool> updateMyInfo({required MyInfoModel myInfo}) {
    // TODO: implement updateMyInfo
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> searchUser({required String searchText}) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      UserModel(
        id: 0,
        nickname: 'Not Found',
        stateMsg: '사용자를 찾을 수 없습니다.',
        profileUrl: null,
        mannerTemperature: 0.0,
      ),
      UserModel(
        id: 1,
        nickname: "searchText",
        stateMsg: '검색된 사용자입니다.',
        profileUrl: null,
        mannerTemperature: 36.5,
      ),
      UserModel(
        id: 1,
        nickname: "searchText",
        stateMsg: '검색된 사용자입니다.',
        profileUrl: null,
        mannerTemperature: 36.5,
      ),
      UserModel(
        id: 1,
        nickname: "searchText",
        stateMsg: '검색된 사용자입니다.',
        profileUrl: null,
        mannerTemperature: 36.5,
      ),
      UserModel(
        id: 1,
        nickname: "searchText",
        stateMsg: '검색된 사용자입니다.',
        profileUrl: null,
        mannerTemperature: 36.5,
      ),
    ];
  }

  @override
  Future<void> addFriend({required String userId}) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
  }

  @override
  Future<List<UserModel>> getBlockedUsers() {
    // TODO: implement getBlockedUsers
    throw UnimplementedError();
  }

  @override
  Future<void> blockUser({required String userId}) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
  }

  @override
  Future<void> unblockUser({required String userId}) async {
    // Just to simulate fetching block list
    await Future.delayed(const Duration(milliseconds: 500), null);
  }

  @override
  Future<void> reportUser({required String userId}) async {
    await Future.delayed(const Duration(milliseconds: 500), null);
  }
}
