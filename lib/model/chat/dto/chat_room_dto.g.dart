// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomDTO _$ChatRoomDTOFromJson(Map<String, dynamic> json) => ChatRoomDTO(
  id: (json['id'] as num).toInt(),
  gatheringCategory: json['gatheringCategory'] as String,
  gatheringDate: DateTime.parse(json['gatheringDate'] as String),
  locationId: (json['locationId'] as num).toInt(),
  title: json['title'] as String,
  profileThumbnailsUrl:
      (json['profileThumbnailsUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  latestMsg: json['latestMsg'] as String,
  latestTime: DateTime.parse(json['latestTime'] as String),
  notReadMsg: (json['notReadMsg'] as num).toInt(),
  contents: json['contents'] as String,
  currentPeopleNum: (json['currentPeopleNum'] as num).toInt(),
  peopleNum: (json['peopleNum'] as num).toInt(),
  currentMaleNum: (json['currentMaleNum'] as num).toInt(),
  maleNum: (json['maleNum'] as num).toInt(),
  currentFemaleNum: (json['currentFemaleNum'] as num).toInt(),
  femaleNum: (json['femaleNum'] as num).toInt(),
  ageFrom: (json['ageFrom'] as num).toInt(),
  ageTo: (json['ageTo'] as num).toInt(),
  genderRestriction: json['genderRestriction'] as String,
  mannerRestriction: json['mannerRestriction'] as bool,
  ageRestriction: json['ageRestriction'] as bool,
);

Map<String, dynamic> _$ChatRoomDTOToJson(ChatRoomDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gatheringCategory': instance.gatheringCategory,
      'gatheringDate': instance.gatheringDate.toIso8601String(),
      'locationId': instance.locationId,
      'title': instance.title,
      'profileThumbnailsUrl': instance.profileThumbnailsUrl,
      'latestMsg': instance.latestMsg,
      'latestTime': instance.latestTime.toIso8601String(),
      'notReadMsg': instance.notReadMsg,
      'contents': instance.contents,
      'currentPeopleNum': instance.currentPeopleNum,
      'peopleNum': instance.peopleNum,
      'currentMaleNum': instance.currentMaleNum,
      'maleNum': instance.maleNum,
      'currentFemaleNum': instance.currentFemaleNum,
      'femaleNum': instance.femaleNum,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'genderRestriction': instance.genderRestriction,
      'mannerRestriction': instance.mannerRestriction,
      'ageRestriction': instance.ageRestriction,
    };

ChatRoomDTO _$ChatRoomDTOFromEntity(ChatRoomEntity entity) => ChatRoomDTO(
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

ChatRoomEntity _$ChatRoomDTOToEntity(ChatRoomDTO instance) => ChatRoomEntity(
  id: instance.id,
  gatheringCategory: instance.gatheringCategory,
  gatheringDate: instance.gatheringDate.toLocal(),
  locationId: instance.locationId,
  title: instance.title,
  profileThumbnailsUrl: instance.profileThumbnailsUrl,
  latestMsg: instance.latestMsg,
  latestTime: instance.latestTime,
  notReadMsg: instance.notReadMsg,
  contents: instance.contents,
  currentPeopleNum: instance.currentPeopleNum,
  peopleNum: instance.peopleNum,
  currentMaleNum: instance.currentMaleNum,
  maleNum: instance.maleNum,
  currentFemaleNum: instance.currentFemaleNum,
  femaleNum: instance.femaleNum,
  ageFrom: instance.ageFrom,
  ageTo: instance.ageTo,
  genderRestriction: instance.genderRestriction,
  mannerRestriction: instance.mannerRestriction,
  ageRestriction: instance.ageRestriction,
);
