import 'dart:convert';

import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/user/my_info_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/repository/user/interface/user_repository.dart';

final class UserRepoImplDev implements UserRepository {
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
  Future<UserModel> searchUser({required String searchText}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/user/search",
      queryParameters: {'searchText': searchText},
    );

    final response = await ApiEnv().cleanClient.get(uri);

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return UserModel.fromJson(json);
  }

  @override
  Future<bool> addFriend({required String userId}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/user/friend/add",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'userId': userId}),
    );

    return true;
  }

  @override
  Future<List<UserModel>> getBlockedUsers() {
    // TODO: implement getBlockedUsers
    throw UnimplementedError();
  }

  @override
  Future<bool> blockUser({required String userId}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/user/block",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'userId': userId}),
    );

    return true;
  }

  @override
  Future<bool> unblockUser({required String userId}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/user/unblock",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'userId': userId}),
    );

    return true;
  }

  @override
  Future<bool> reportUser({required String userId}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/user/report",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'userId': userId}),
    );

    return true;
  }
}
