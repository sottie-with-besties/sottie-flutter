import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_model.freezed.dart';
part 'post_detail_model.g.dart';

@freezed
class PostDetailModel with _$PostDetailModel {
  factory PostDetailModel({
    /// 포스트 상세화면 ID
    required String id,

    /// 포스트를 설명하는 구체적 내용
    required String content,

    /// 모집하는 나이대(10대, 20대, 30대...)
    required List<String> ageRange,

    /// 요구 매너 온도
    required double mannerPoint,

    /// 동시 시작 여부
    required bool startSameTime,

    /// 내 친구만 입장 가능 여부
    required bool onlyMyFriends,
  }) = _PostDetailModel;

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PostDetailModelFromJson(json);
}
