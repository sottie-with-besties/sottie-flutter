// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDTO _$PostDTOFromJson(Map<String, dynamic> json) => PostDTO(
  id: (json['id'] as num).toInt(),
  gatheringCategory: json['gatheringCategory'] as String,
  title: json['title'] as String,
  locationId: (json['locationId'] as num).toInt(),
  gatheringDate: DateTime.parse(json['gatheringDate'] as String),
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

Map<String, dynamic> _$PostDTOToJson(PostDTO instance) => <String, dynamic>{
  'id': instance.id,
  'gatheringCategory': instance.gatheringCategory,
  'title': instance.title,
  'locationId': instance.locationId,
  'gatheringDate': instance.gatheringDate.toIso8601String(),
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

PostDTO _$PostDTOFromEntity(PostEntity entity) => PostDTO(
  id: entity.id,
  gatheringCategory: entity.postCategory.name,
  title: entity.title,
  locationId: entity.postLocation.index,
  gatheringDate: entity.postDate,
  contents: entity.contents,
  currentPeopleNum: entity.numOfCurrentPeople,
  peopleNum: entity.numOfPeople,
  currentMaleNum: entity.numOfCurrentMale,
  maleNum: entity.numOfMale,
  currentFemaleNum: entity.numOfCurrentFemale,
  femaleNum: entity.numOfFemale,
  ageFrom: entity.ageFrom,
  ageTo: entity.ageTo,
  genderRestriction: entity.genderRestriction.name,
  mannerRestriction: entity.mannerRestriction,
  ageRestriction: entity.ageRestriction,
);

PostEntity _$PostDTOToEntity(PostDTO instance) => PostEntity(
  id: instance.id,
  postCategory: PostCategory.values.byName(instance.gatheringCategory),
  title: instance.title,
  postLocation: PostLocation.values[instance.locationId],
  postDate: instance.gatheringDate.toLocal(),
  contents: instance.contents,
  numOfCurrentPeople: instance.currentPeopleNum,
  numOfPeople: instance.peopleNum,
  numOfCurrentMale: instance.currentMaleNum,
  numOfMale: instance.maleNum,
  numOfCurrentFemale: instance.currentFemaleNum,
  numOfFemale: instance.femaleNum,
  ageFrom: instance.ageFrom,
  ageTo: instance.ageTo,
  genderRestriction: PostGenderRestriction.values.byName(
    instance.genderRestriction,
  ),
  mannerRestriction: instance.mannerRestriction,
  ageRestriction: instance.ageRestriction,
);
