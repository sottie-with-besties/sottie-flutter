import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_review_model.freezed.dart';
part 'user_review_model.g.dart';

@freezed
class UserReviewModelList with _$UserReviewModelList {
  factory UserReviewModelList({
    required List<UserReviewModel> userReviewModelList,
  }) = _UserReviewModelList;

  factory UserReviewModelList.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelListFromJson(json);
}

@freezed
class UserReviewModel with _$UserReviewModel {
  factory UserReviewModel({
    required String id,
    required String nickname,
    required int total,
    required int participationIndex,
    required int attitudeIndex,
    required int timeIndex,
    required int likeabilityIndex,
    required int trustworthinessIndex,
  }) = _UserReviewModel;

  factory UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);
}
