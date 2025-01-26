import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/repository_impl/search_post_dummy.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/domain/post/entity/post_pagination_entity.dart';
import 'package:sottie_flutter/domain/post/use_case/post_use_case.dart';

part 'home_search_post_provider.g.dart';

final _useCase = GetIt.I.get<PostUseCase>();

@Riverpod(keepAlive: true)
final class HomeSearchPost extends _$HomeSearchPost {
  @override
  PostPaginationEntity build() {
    return PostPaginationEntity(
      postEntityList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  /// 검색 => 검색 조건에 부합하는 모집글 가져오기
  Future<void> searchPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationEntity(
          postEntityList: state.postEntityList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final postList =
          await getSearchPostDummy(postOptions.toJsonForSearchFiltering());

      // final postList = await _useCase.getSearchPostEntityList(
      //   searchSetting: postOptions.toJsonForSearchFiltering(),
      //   lastPostId: firstFetch ? 0 : state.postEntityList.last.id,
      // );

      if (postList.isEmpty) {
        state = PostPaginationEntity(
            postEntityList: postList,
            postPaginationState: PostPaginationState.error,
            errorCode: '데이터가 더 이상 존재하지 않습니다');
      } else {
        state = PostPaginationEntity(
          postEntityList: [
            ...state.postEntityList,
            ...postList,
          ],
          postPaginationState: PostPaginationState.fetch,
        );
      }
    } on Exception catch (_) {
      state = PostPaginationEntity(
        postEntityList: state.postEntityList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
