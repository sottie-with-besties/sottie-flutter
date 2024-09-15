import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_detail_model.freezed.dart';
part 'friend_detail_model.g.dart';

@freezed
class FriendDetailModel with _$FriendDetailModel {
  factory FriendDetailModel({
    required String id,
    required String nickname,
    required String? stateMsg,
    required double? participationValue,
    required double? attitudeValue,
    required double? timeValue,
    required double? likeabilityValue,
    required double? trustworthinessValue,
    required List<FriendReviewModel>? friendReviews,
  }) = _FriendDetailModel;

  factory FriendDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FriendDetailModelFromJson(json);
}

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
