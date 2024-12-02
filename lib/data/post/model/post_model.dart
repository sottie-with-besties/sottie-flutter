import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    /// 포스트 ID
    required int id,

    /// 포스트의 카테고리
    required String gatheringCategory,

    /// 포스트 제목
    required String title,

    /// 모집 장소
    required int locationId,

    /// 모집 날짜
    required DateTime gatheringDate,

    /// 포스트를 설명하는 구체적 내용
    required String content,

    /// 성비 제한이 없을 경우 currentPeopleNum, peopleNum
    /// 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
    required int currentPeopleNum,
    required int peopleNum,
    required int currentMaleNum,
    required int maleNum,
    required int currentFemaleNum,
    required int femaleNum,

    /// 모집하는 나이대(10대, 20대, 30대...)
    required List<int> ageRange,

    /// 내 친구만 입장 가능 여부
    required bool onlyMyFriends,

    /// 성비 제한
    required String genderRestriction,

    /// 매너 온도 일정 기준 이상
    required bool mannerRestriction,

    /// 나이 제한
    required bool ageRestriction,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
