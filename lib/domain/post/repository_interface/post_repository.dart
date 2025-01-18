import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';

abstract interface class PostRepository {
  /// 최신 포스트 불러오기
  Future<List<PostModel>> getLatestPostModelList({required int lastPostId});

  /// 검색 포스트 불러오기
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  });

  /// 포스트 만들기
  Future<HttpResponse> makePost({required Map<String, dynamic> postSetting});

  /// 포스트 모집 참가
  Future<HttpResponse> postJoin({required Map<String, dynamic> postJoinInfo});

  /// 포스트 모집 나가기
  Future<HttpResponse> postExit();
}
