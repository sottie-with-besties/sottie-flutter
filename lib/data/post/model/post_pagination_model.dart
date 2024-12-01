import 'package:sottie_flutter/data/post/model/post_model.dart';

enum PostPaginationState {
  fetch,
  firstLoading,
  loading,
  error,
}

class PostPaginationModel {
  final List<PostModel> postModelList;
  final PostPaginationState postPaginationState;
  final String? errorCode;

  PostPaginationModel({
    required this.postModelList,
    required this.postPaginationState,
    this.errorCode,
  });
}
