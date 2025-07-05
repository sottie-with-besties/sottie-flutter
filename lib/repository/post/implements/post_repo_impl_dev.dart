import 'dart:convert';

import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/interface/post_repository.dart';

final class PostRepoImplDev implements PostRepository {
  @override
  Future<List<PostModel>> getLatestPostModelList({
    required int lastPostId,
  }) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gatherings",
      queryParameters: {'lastPostId': lastPostId.toString()},
    );

    final response = await ApiEnv().cleanClient.get(uri);

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  }) async {
    final Map<String, String> queryParams = {
      'lastPostId': lastPostId.toString(),
      ...searchSetting.map((key, value) => MapEntry(key, value.toString())),
    };

    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/home/search",
      queryParameters: queryParams,
    );

    final response = await ApiEnv().cleanClient.get(uri);

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> makePost({required Map<String, dynamic> postSetting}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode(postSetting),
    );
  }

  @override
  Future<void> postJoin({required Map<String, dynamic> postJoinInfo}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering/join",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode(postJoinInfo),
    );
  }

  @override
  Future<void> postExit() async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering/exit",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(uri, headers: headers);
  }
}
