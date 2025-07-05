import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/implements/post_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/post/implements/post_repo_impl_dummy.dart';

abstract interface class PostRepository {
  factory PostRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => PostRepoImplDummy(),
      ServerEnvironment.dev => PostRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  // 최신 포스트 불러오기
  Future<List<PostModel>> getLatestPostModelList({required int lastPostId});

  // 검색 포스트 불러오기
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  });

  // 포스트 만들기
  Future<void> makePost({required Map<String, dynamic> postSetting});

  // 포스트 참여
  Future<void> postJoin({required Map<String, dynamic> postJoinInfo});

  // 포스트 참여 취소
  Future<void> postExit();
}
