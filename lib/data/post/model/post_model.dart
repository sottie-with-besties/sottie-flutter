import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    /// 포스트 ID
    required String id,

    /// 포스트를 터치했을 때 나오는 포스트 상세화면 ID
    required String detailId,

    /// 포스트의 카테고리
    required String category,

    /// 포스트 제목
    required String title,

    /// 모집 장소
    required String location,

    /// 모집 날짜
    required String date,

    /// 성비 제한이 없을 경우 currentMemberCount, maxMemberCount
    /// 성비 제한이 있을 경우 currentManCount, maxManCount, currentWomanCount, maxWomanCount
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
