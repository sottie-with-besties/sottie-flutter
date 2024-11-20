import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

part 'home_search_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeSearchPost extends _$HomeSearchPost {
  @override
  Future<PostPaginationModel> build() async {
    return PostPaginationModel(
      postModelList: <PostModel>[],
      postPaginationState: PostPaginationState.loading,
    );
  }

  /// 검색 => 검색 조건에 부합하는 모집글 가져오기
  Future<void> searchPost() async {
    final searchFilteringData = postSettingEntity.toJsonForSearchFiltering();
  }
}
