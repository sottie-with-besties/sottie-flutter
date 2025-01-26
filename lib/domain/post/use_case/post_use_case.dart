import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/domain/post/entity/post_entity.dart';
import 'package:sottie_flutter/domain/post/repository_interface/post_repository.dart';

final _repo = GetIt.I.get<PostRepository>();

final class PostUseCase {
  /// 최신 모집글 불러오기
  Future<List<PostEntity>> getLatestPostEntityList(
      {required int lastPostId}) async {
    final postModelList =
        await _repo.getLatestPostModelList(lastPostId: lastPostId);

    final postEntityList = <PostEntity>[];

    for (PostModel model in postModelList) {
      postEntityList.add(PostEntity.fromModel(model: model));
    }

    return postEntityList;
  }

  /// 검색 모집글 불러오기
  Future<List<PostEntity>> getSearchPostEntityList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  }) async {
    final postModelList = await _repo.getSearchPostModelList(
        searchSetting: searchSetting, lastPostId: lastPostId);

    final postEntityList = <PostEntity>[];

    for (PostModel model in postModelList) {
      postEntityList.add(PostEntity.fromModel(model: model));
    }

    return postEntityList;
  }
}
