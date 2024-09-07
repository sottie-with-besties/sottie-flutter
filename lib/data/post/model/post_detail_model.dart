import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_model.freezed.dart';
part 'post_detail_model.g.dart';

@freezed
class PostDetailModel with _$PostDetailModel {
  factory PostDetailModel({
    required String id,
    required List<String> thumbnailUrls,
    required String content,
    required List<String> ages,
    required double mannerPoint,
    required bool startSameTime,
    required bool openParticipation,
    required bool onlyMyFriends,
  }) = _PostDetailModel;

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PostDetailModelFromJson(json);
}
