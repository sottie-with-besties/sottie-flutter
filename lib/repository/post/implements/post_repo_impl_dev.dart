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

    // await Future.delayed(const Duration(seconds: 1), null);
    // return [
    //   PostModel(
    //     id: 3,
    //     postCategory: PostCategory.THUNDER,
    //     title: '안녕하세요',
    //     postLocation: PostLocation.seoul,
    //     postDate: DateTime(2024),
    //     contents: '안녕하세요안녕하세요',
    //     numOfCurrentPeople: 3,
    //     numOfPeople: 5,
    //     numOfCurrentMale: 1,
    //     numOfMale: 3,
    //     numOfCurrentFemale: 2,
    //     numOfFemale: 2,
    //     ageFrom: 1,
    //     ageTo: 1,
    //     genderRestriction: PostGenderRestriction.NONE,
    //     mannerRestriction: true,
    //     ageRestriction: true,
    //   ),
    //   PostModel(
    //     id: 3,
    //     postCategory: PostCategory.THUNDER,
    //     title: '안녕하세요',
    //     postLocation: PostLocation.seoul,
    //     postDate: DateTime(2024),
    //     contents: '안녕하세요안녕하세요',
    //     numOfCurrentPeople: 4,
    //     numOfPeople: 5,
    //     numOfCurrentMale: 4,
    //     numOfMale: 5,
    //     numOfCurrentFemale: 0,
    //     numOfFemale: 0,
    //     ageFrom: 2,
    //     ageTo: 5,
    //     genderRestriction: PostGenderRestriction.MALE,
    //     mannerRestriction: true,
    //     ageRestriction: true,
    //   ),
    //   PostModel(
    //     id: 3,
    //     postCategory: PostCategory.THUNDER,
    //     title: '안녕하세요',
    //     postLocation: PostLocation.seoul,
    //     postDate: DateTime(2024),
    //     contents: '안녕하세요안녕하세요',
    //     numOfCurrentPeople: 3,
    //     numOfPeople: 5,
    //     numOfCurrentMale: 2,
    //     numOfMale: 3,
    //     numOfCurrentFemale: 2,
    //     numOfFemale: 2,
    //     ageFrom: 5,
    //     ageTo: 6,
    //     genderRestriction: PostGenderRestriction.MIX,
    //     mannerRestriction: true,
    //     ageRestriction: false,
    //   ),
    // ];
  }

  @override
  Future<bool> makePost({required Map<String, dynamic> postSetting}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode(postSetting),
    );

    return true;
  }

  @override
  Future<bool> postJoin({required Map<String, dynamic> postJoinInfo}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering/join",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode(postJoinInfo),
    );
    
    return true;
  }

  @override
  Future<bool> postExit() async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/sottie/gathering/exit",
    );

    final headers = {'Content-Type': 'application/json'};

    final response = await ApiEnv().cleanClient.post(uri, headers: headers);

    return true;
  }
}
