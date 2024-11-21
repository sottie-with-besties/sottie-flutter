import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/data_source/recommend_post_dummy.dart';
import 'package:sottie_flutter/data/post/data_source/search_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/domain/home/home_post_pagination.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

part 'home_search_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeSearchPost extends _$HomeSearchPost {
  @override
  PostPaginationModel build() {
    return PostPaginationModel(
      postModelList: [],
      postPaginationState: PostPaginationState.loading,
    );
  }

  /// 검색 => 검색 조건에 부합하는 모집글 가져오기
  Future<void> searchPost() async {
    try {
      state = PostPaginationModel(
        postModelList: [],
        postPaginationState: PostPaginationState.loading,
      );

      /// 서버에 보낼 데이터
      final searchFilteringData = postSettingEntity.toJsonForSearchFiltering();
      final postModelList = await getSearchPostDummy(searchFilteringData);

      state = PostPaginationModel(
        postModelList: postModelList,
        postPaginationState: PostPaginationState.fetch,
      );
    } on Exception catch (_) {
      state = PostPaginationModel(
        postModelList: state.postModelList,
        postPaginationState: PostPaginationState.error,
        errorCode: '검색 도중 에러가 발생하였습니다.',
      );
    }
  }

  Future<void> searchPagination() async {
    state = PostPaginationModel(
      postModelList: state.postModelList,
      postPaginationState: PostPaginationState.loading,
    );

    final newPostPaginationModel =
        await homePostPagination(state, getRecommendPostDummy, "123");

    // Todo: Error 반환 시 예외 처리

    state = PostPaginationModel(postModelList: [
      ...state.postModelList,
      ...newPostPaginationModel.postModelList
    ], postPaginationState: PostPaginationState.fetch, errorCode: "에러발생");
  }
}
