import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/data/post/data_source/search_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/repository/home/home_post_retrofit.dart';

part 'home_search_post_provider.g.dart';

final _repo = HomePostRetrofit(customDio);

@Riverpod(keepAlive: true)
final class HomeSearchPost extends _$HomeSearchPost {
  @override
  PostPaginationModel build() {
    return PostPaginationModel(
      postModelList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  /// 검색 => 검색 조건에 부합하는 모집글 가져오기
  Future<void> searchPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationModel(
          postModelList: state.postModelList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final postList = await getSearchPostDummy(
          postSettingEntity.toJsonForSearchFiltering());

      // final postList = await _repo.getSearchPostModelList(
      //     searchSetting: postSettingEntity.toJsonForSearchFiltering(),
      //     lastPostId: firstFetch ? 0 : state.postModelList.last.id);

      if (postList.isEmpty) {
        state = PostPaginationModel(
            postModelList: postList,
            postPaginationState: PostPaginationState.error,
            errorCode: '데이터가 더 이상 존재하지 않습니다');
      } else {
        state = PostPaginationModel(
          postModelList: [
            ...state.postModelList,
            ...postList,
          ],
          postPaginationState: PostPaginationState.fetch,
        );
      }
    } on Exception catch (_) {
      state = PostPaginationModel(
        postModelList: state.postModelList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
