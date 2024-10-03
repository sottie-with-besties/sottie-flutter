import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required String id,
    required String detailId,
    required List<String> category,
    String? thumbnailUrl,
    required String title,
    required String location,
    required String date,
    int? currentMemberCount,
    int? maxMemberCount,
    int? currentManCount,
    int? maxManCount,
    int? currentWomanCount,
    int? maxWomanCount,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
