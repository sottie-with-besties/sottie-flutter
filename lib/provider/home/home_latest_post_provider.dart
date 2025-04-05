import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/post/entity/post_pagination_entity.dart';
import 'package:sottie_flutter/use_case/post/post_use_case.dart';

part 'home_latest_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeLatestPost extends _$HomeLatestPost {
  @override
  PostPaginationEntity build() {
    return PostPaginationEntity(
      postEntityList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  Future<void> latestPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationEntity(
          postEntityList: state.postEntityList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final entityList = await PostUseCase().getLatestPostEntityList(
        lastPostId: firstFetch ? 0 : state.postEntityList.last.id,
      );

      // final postList = await getLatestPostDummy("123");

      if (entityList.isEmpty) {
        state = PostPaginationEntity(
          postEntityList: entityList,
          postPaginationState: PostPaginationState.error,
          errorCode: '데이터가 더 이상 존재하지 않습니다',
        );
      } else {
        state = PostPaginationEntity(
          postEntityList: [...state.postEntityList, ...entityList],
          postPaginationState: PostPaginationState.fetch,
        );
      }
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      state = PostPaginationEntity(
        postEntityList: state.postEntityList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
