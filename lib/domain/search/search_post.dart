import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

Future<void> searchPost() async {
  final searchContent = {
    'title': postSettingEntity.title,
    'category': postSettingEntity.convertCategoryToStringList(), // Enum 데이터
    'date': postSettingEntity.date != null
        ? postSettingEntity.date!.toUtc()
        : '', // Todo: 날짜, 시간 각각 나누어서 Range로 바꾸어야함
    'location': postSettingEntity.location.toString(), // Enum 데이터
    'numOfMember': postSettingEntity.numOfMember,
    'gender': postSettingEntity.gender.name, // Enum 데이터
    'genderRatio': postSettingEntity.genderRatio,
    'numOfMan': postSettingEntity.numOfMan,
    'numOfWoman': postSettingEntity.numOfWoman,
    'ageRange': postSettingEntity.convertAgeRangeToStringList(), // Enum 데이터
    'manner': postSettingEntity.manner,
    'startSameTime': postSettingEntity.startSameTime,
    'openParticipation': postSettingEntity.openParticipation,
    'onlyMyFriends': postSettingEntity.onlyMyFriends,
  };
}
