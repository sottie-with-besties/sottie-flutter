import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_feed_model.freezed.dart';
part 'find_feed_model.g.dart';

@freezed
class FindFeedModel with _$FindFeedModel {
  factory FindFeedModel({
    required String id,
    required String detailId,
    required String category,
    required int currentMemberCount,
    required int maxMemberCount,
    required String title,
    required String location,
    required String date,
  }) = _FindFeedModel;

  factory FindFeedModel.fromJson(Map<String, dynamic> json) =>
      _$FindFeedModelFromJson(json);
}
