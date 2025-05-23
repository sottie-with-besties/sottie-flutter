import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/implements/post_repo_impl_dev.dart';

abstract interface class PostRepository {
  factory PostRepository() {
    return PostRepoImplDev();
  }

  /// 최신 포스트 불러오기
  Future<List<PostModel>> getLatestPostModelList({required int lastPostId});

  /// 검색 포스트 불러오기
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  });

  /// 포스트 만들기
  Future<bool> makePost({required Map<String, dynamic> postSetting});

  /// 포스트 모집 참가
  Future<bool> postJoin({required Map<String, dynamic> postJoinInfo});

  /// 포스트 모집 나가기
  Future<bool> postExit();
}
