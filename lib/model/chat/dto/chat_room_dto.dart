import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_dto.freezed.dart';

part 'chat_room_dto.g.dart';

@freezed
sealed class ChatRoomDTO with _$ChatRoomDTO {
  factory ChatRoomDTO({
    required int id,

    /// 채팅의 카테고리(친목, 번개, 구인/구직 등)
    required String gatheringCategory,

    /// 모임 날짜
    required DateTime gatheringDate,

    /// 모임 장소
    required int locationId,

    /// 채팅 제목
    required String title,

    /// 최대 4개까지만
    required List<String> profileThumbnailsUrl,

    /// 가장 최근의 메세지
    required String latestMsg,

    /// 최근 전송 받은 메세지의 시각
    required DateTime latestTime,

    /// 유저가 해당하는 채팅방의 읽지 않은 메세지 수
    required int notReadMsg,

    /// 채팅방을 설명하는 구체적 내용
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

    /// 매너 제한
    required bool mannerRestriction,

    /// 나이 제한
    required bool ageRestriction,
  }) = _ChatRoomDTO;

  factory ChatRoomDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDTOFromJson(json);
}
