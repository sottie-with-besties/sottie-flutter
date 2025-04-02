import 'package:sottie_flutter/model/post/entity/post_entity.dart';

enum PostPaginationState { fetch, firstLoading, loading, error }

class PostPaginationEntity {
  final List<PostEntity> postEntityList;
  final PostPaginationState postPaginationState;
  final String? errorCode;

  PostPaginationEntity({
    required this.postEntityList,
    required this.postPaginationState,
    this.errorCode,
  });
}
