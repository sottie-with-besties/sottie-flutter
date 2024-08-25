import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_review_model.freezed.dart';
part 'friend_review_model.g.dart';

@freezed
class FriendReviewModel with _$FriendReviewModel {
  factory FriendReviewModel({
    required String id,
    required String nickname,
    required int total,
    required int participationIndex,
    required int attitudeIndex,
    required int timeIndex,
    required int likeabilityIndex,
    required int trustworthinessIndex,
  }) = _FriendReviewModel;

  factory FriendReviewModel.fromJson(Map<String, dynamic> json) =>
      _$FriendReviewModelFromJson(json);
}
