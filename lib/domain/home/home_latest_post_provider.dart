import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/repository/home/home_post_repository.dart';

part 'home_latest_post_provider.g.dart';

final _repo = HomePostRepository(customDio);

@Riverpod(keepAlive: true)
final class HomeLatestPost extends _$HomeLatestPost {
  @override
  PostPaginationModel build() {
    return PostPaginationModel(
      postModelList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  Future<void> latestPagination({bool firstFetch = false}) async {
    try {
      if (!firstFetch) {
        state = PostPaginationModel(
          postModelList: state.postModelList,
          postPaginationState: PostPaginationState.loading,
        );
      }

      final postList = await _repo.getLatestPostModelList(
        lastPostId: firstFetch ? 0 : state.postModelList.last.id,
      );

      // final postList = await getLatestPostDummy("123");

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
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      state = PostPaginationModel(
        postModelList: state.postModelList,
        postPaginationState: PostPaginationState.error,
        errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
      );
    }
  }
}
