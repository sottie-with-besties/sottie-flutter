import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/data_source/recommend_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';

part 'home_recommended_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeRecommendedPost extends _$HomeRecommendedPost {
  @override
  Future<PostPaginationModel> build() async {
    final postModelList = await getRecommendPostDummy(null);

    return PostPaginationModel(
      postModelList: postModelList,
      postPaginationState: PostPaginationState.fetch,
    );
  }
}
