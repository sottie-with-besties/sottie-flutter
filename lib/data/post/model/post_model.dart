import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required String id,
    required String detailId,
    required String category,
    required int currentMemberCount,
    required int maxMemberCount,
    required String title,
    required String location,
    required String date,
  }) = _FindFeedModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
