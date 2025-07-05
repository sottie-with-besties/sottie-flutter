import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/user/my_info_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/user/implements/user_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/user/implements/user_repo_impl_dummy.dart';

abstract interface class UserRepository {
  factory UserRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => UserRepoImplDummy(),
      ServerEnvironment.dev => UserRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  /// 내 정보 받아오기
  Future<MyInfoModel> getMyInfo();

  /// 내 정보 서버로 전송
  Future<void> updateMyInfo({required MyInfoModel myInfo});

  /// 유저 검색
  Future<UserModel> searchUser({required String searchText});

  /// 유저 친구 추가
  Future<void> addFriend({required String userId});

  /// 유저 차단 목록
  Future<List<UserModel>> getBlockedUsers();

  /// 유저 차단
  Future<void> blockUser({required String userId});

  /// 유저 차단 취소
  Future<void> unblockUser({required String userId});

  /// 유저 신고
  Future<void> reportUser({required String userId});
}
