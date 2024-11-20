import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/data/post/model/post_pagination_model.dart';

part 'home_recommended_post_provider.g.dart';

@Riverpod(keepAlive: true)
final class HomeRecommendedPost extends _$HomeRecommendedPost {
  @override
  Future<PostPaginationModel> build() async {
    return PostPaginationModel(
      postModelList: <PostModel>[],
      postPaginationState: PostPaginationState.loading,
    );
  }
}
