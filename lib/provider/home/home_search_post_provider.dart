import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/data/post/repository_impl/post_dev_repository_impl.dart';
import 'package:sottie_flutter/data/post/repository_impl/search_post_dummy.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/domain/post/entity/post_pagination_entity.dart';

part 'home_search_post_provider.g.dart';

final _repo = PostDevRepositoryImpl(customDio);

@Riverpod(keepAlive: true)
final class HomeSearchPost extends _$HomeSearchPost {
  @override
  PostPaginationEntity build() {
    return PostPaginationEntity(
      postModelList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  /// 검색 => 검색 조건에 부합하는 모집글 가져오기
  Future<void> searchPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationEntity(
          postModelList: state.postModelList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final postList =
          await getSearchPostDummy(postOptions.toJsonForSearchFiltering());

      // final postList = await _repo.getSearchPostModelList(
      //     searchSetting: postSettingEntity.toJsonForSearchFiltering(),
      //     lastPostId: firstFetch ? 0 : state.postModelList.last.id);

      if (postList.isEmpty) {
        state = PostPaginationEntity(
            postModelList: postList,
            postPaginationState: PostPaginationState.error,
            errorCode: '데이터가 더 이상 존재하지 않습니다');
      } else {
        state = PostPaginationEntity(
          postModelList: [
            ...state.postModelList,
            ...postList,
          ],
          postPaginationState: PostPaginationState.fetch,
        );
      }
    } on Exception catch (_) {
      state = PostPaginationEntity(
        postModelList: state.postModelList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
