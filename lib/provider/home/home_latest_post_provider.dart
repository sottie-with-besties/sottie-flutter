import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/data/post/data_source/post_data_source.dart';
import 'package:sottie_flutter/domain/post/entity/post_pagination_entity.dart';

part 'home_latest_post_provider.g.dart';

final _repo = PostDataSource(customDio);

@Riverpod(keepAlive: true)
final class HomeLatestPost extends _$HomeLatestPost {
  @override
  PostPaginationEntity build() {
    return PostPaginationEntity(
      postModelList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  Future<void> latestPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationEntity(
          postModelList: state.postModelList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final postList = await _repo.getLatestPostModelList(
        lastPostId: firstFetch ? 0 : state.postModelList.last.id,
      );

      // final postList = await getLatestPostDummy("123");

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
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      state = PostPaginationEntity(
        postModelList: state.postModelList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
