import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/data_source/latest_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';
import 'package:sottie_flutter/domain/home/home_post_pagination.dart';

part 'home_latest_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeLatestPost extends _$HomeLatestPost {
  @override
  PostPaginationModel build() {
    return PostPaginationModel(
      postModelList: [],
      postPaginationState: PostPaginationState.firstLoading,
    );
  }

  Future<void> firstFetch() async {
    final postList = await getLatestPostDummy("123213");

    state = PostPaginationModel(
      postModelList: postList,
      postPaginationState: PostPaginationState.fetch,
    );
  }

  Future<void> latestPagination() async {
    state = PostPaginationModel(
      postModelList: state.postModelList,
      postPaginationState: PostPaginationState.loading,
    );

    final newPostPaginationModel =
        await homePostPagination(state, getLatestPostDummy, "123");

    // Todo: Error 반환 시 예외 처리

    state = PostPaginationModel(postModelList: [
      ...state.postModelList,
      ...newPostPaginationModel.postModelList
    ], postPaginationState: PostPaginationState.fetch, errorCode: "에러발생");
  }
}
