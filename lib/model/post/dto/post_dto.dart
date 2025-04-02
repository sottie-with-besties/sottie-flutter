import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dto.freezed.dart';

part 'post_dto.g.dart';

@freezed
sealed class PostDTO with _$PostDTO {
  factory PostDTO({
    /// 포스트 ID
    required int id,

    /// 모임 카테고리
    required String gatheringCategory,

    /// 포스트 제목
    required String title,

    /// 모임 장소
    required int locationId,

    /// 모임 날짜
    required DateTime gatheringDate,

    /// 포스트를 설명하는 구체적 내용
    required String contents,

    /// 성비 제한이 없을 경우 currentPeopleNum, peopleNum
    /// 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
    required int currentPeopleNum,
    required int peopleNum,
    required int currentMaleNum,
    required int maleNum,
    required int currentFemaleNum,
    required int femaleNum,

    /// 최소 나이대
    required int ageFrom,

    /// 최대 나이대
    required int ageTo,

    /// 내 친구만 입장 가능 여부
    required bool onlyMyFriends,

    /// 성비 제한
    required String genderRestriction,

    /// 매너 온도 일정 기준 이상
    required bool mannerRestriction,

    /// 나이 제한
    required bool ageRestriction,
  }) = _PostDTO;

  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);
}
