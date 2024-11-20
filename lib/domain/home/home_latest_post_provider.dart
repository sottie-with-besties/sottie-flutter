import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/data_source/latest_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';

part 'home_latest_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeLatestPost extends _$HomeLatestPost {
  @override
  Future<PostPaginationModel> build() async {
    final postModelList = await getLatestPostDummy(null);

    return PostPaginationModel(
      postModelList: postModelList,
      postPaginationState: PostPaginationState.fetch,
    );
  }
}
