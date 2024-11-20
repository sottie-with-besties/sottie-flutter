import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';

// Todo: 리버팟의 State를 직접 함수로 넘겨서 함수 내부에서 바꾸어도 상태가 변화?
Future<PostPaginationModel> homePostPagination(
  PostPaginationModel state,
  Future<List<PostModel>> Function(String lastPostId) getPostList,
  String lastId,
) async {
  try {
    state = PostPaginationModel(
      postModelList: state.postModelList,
      postPaginationState: PostPaginationState.loading,
    );

    final postList = await getPostList(lastId);
    return PostPaginationModel(
      postModelList: postList,
      postPaginationState: PostPaginationState.fetch,
    );
  } on Exception catch (_) {
    return PostPaginationModel(
      postModelList: state.postModelList,
      postPaginationState: PostPaginationState.error,
      errorCode: '모집글을 불러오는 도중 에러가 발생했습니다.',
    );
  }
}
