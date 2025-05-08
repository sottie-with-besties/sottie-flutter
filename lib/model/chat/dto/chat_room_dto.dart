import 'package:json_annotation/json_annotation.dart';
import 'package:sottie_flutter/model/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/model/common/dto_interface.dart';

part 'chat_room_dto.g.dart';

@JsonSerializable()
final class ChatRoomDTO implements DTO {
  final int id;

  /// 채팅의 카테고리(친목, 번개, 구인/구직 등)
  final String gatheringCategory;

  /// 모임 날짜
  final DateTime gatheringDate;

  /// 모임 장소
  final int locationId;

  /// 채팅 제목
  final String title;

  /// 최대 4개까지만
  final List<String> profileThumbnailsUrl;

  /// 가장 최근의 메세지
  final String latestMsg;

  /// 최근 전송 받은 메세지의 시각
  final DateTime latestTime;

  /// 유저가 해당하는 채팅방의 읽지 않은 메세지 수
  final int notReadMsg;

  /// 채팅방을 설명하는 구체적 내용
  final String contents;

  /// 성비 제한이 없을 경우 currentPeopleNum, peopleNum
  /// 성비 제한이 있을 경우 currentMaleNum, maleNum, currentFemaleNum, femaleNum
  final int currentPeopleNum;
  final int peopleNum;
  final int currentMaleNum;
  final int maleNum;
  final int currentFemaleNum;
  final int femaleNum;

  /// 최소 나이대
  final int ageFrom;

  /// 최대 나이대
  final int ageTo;

  /// 성비 제한
  final String genderRestriction;

  /// 매너 제한
  final bool mannerRestriction;

  /// 나이 제한
  final bool ageRestriction;

  ChatRoomDTO({
    required this.id,
    required this.gatheringCategory,
    required this.gatheringDate,
    required this.locationId,
    required this.title,
    required this.profileThumbnailsUrl,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
    required this.contents,
    required this.currentPeopleNum,
    required this.peopleNum,
    required this.currentMaleNum,
    required this.maleNum,
    required this.currentFemaleNum,
    required this.femaleNum,
    required this.ageFrom,
    required this.ageTo,
    required this.genderRestriction,
    required this.mannerRestriction,
    required this.ageRestriction,
  });

  factory ChatRoomDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomDTOToJson(this);

  factory ChatRoomDTO.fromEntity({required ChatRoomEntity entity}) {
    return ChatRoomDTO(
      id: entity.id,
      gatheringCategory: entity.gatheringCategory,
      gatheringDate: entity.gatheringDate,
      locationId: entity.locationId,
      title: entity.title,
      profileThumbnailsUrl: entity.profileThumbnailsUrl,
      latestMsg: entity.latestMsg,
      latestTime: entity.latestTime,
      notReadMsg: entity.notReadMsg,
      contents: entity.contents,
      currentPeopleNum: entity.currentPeopleNum,
      peopleNum: entity.peopleNum,
      currentMaleNum: entity.currentMaleNum,
      maleNum: entity.maleNum,
      currentFemaleNum: entity.currentFemaleNum,
      femaleNum: entity.femaleNum,
      ageFrom: entity.ageFrom,
      ageTo: entity.ageTo,
      genderRestriction: entity.genderRestriction,
      mannerRestriction: entity.mannerRestriction,
      ageRestriction: entity.ageRestriction,
    );
  }

  @override
  ChatRoomEntity toEntity() {
    return ChatRoomEntity(
      id: id,
      gatheringCategory: gatheringCategory,
      gatheringDate: gatheringDate.toLocal(),
      locationId: locationId,
      title: title,
      profileThumbnailsUrl: profileThumbnailsUrl,
      latestMsg: latestMsg,
      latestTime: latestTime,
      notReadMsg: notReadMsg,
      contents: contents,
      currentPeopleNum: currentPeopleNum,
      peopleNum: peopleNum,
      currentMaleNum: currentMaleNum,
      maleNum: maleNum,
      currentFemaleNum: currentFemaleNum,
      femaleNum: femaleNum,
      ageFrom: ageFrom,
      ageTo: ageTo,
      genderRestriction: genderRestriction,
      mannerRestriction: mannerRestriction,
      ageRestriction: ageRestriction,
    );
  }
}
