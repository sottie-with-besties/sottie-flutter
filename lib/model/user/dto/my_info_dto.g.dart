// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyInfoDTOImpl _$$MyInfoDTOImplFromJson(Map<String, dynamic> json) =>
    _$MyInfoDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? 45152341245,
      name: json['name'] as String? ?? '김진표',
      email: json['email'] as String? ?? 'kasdasdasd7@gmail.com',
      nickName: json['nickName'] as String? ?? '나의 닉네임',
      password: json['password'] as String? ?? '12343456778',
      phoneNumber: json['phoneNumber'] as String? ?? '01011111111',
      gender: json['gender'] as String? ?? 'MALE',
      identifier: json['identifier'] as String? ?? '123123123',
      birthYear: json['birthYear'] as String? ?? '1111년 1월 1일',
      phoneAuthenticated: json['phoneAuthenticated'] as bool? ?? false,
      stateMessage: json['stateMessage'] as String?,
      profileUrl: json['profileUrl'] as String?,
      myProfilePath: json['myProfilePath'] as String?,
      gold: (json['gold'] as num?)?.toInt() ?? 0,
      mannerPoint: (json['mannerPoint'] as num?)?.toDouble() ?? 36.5,
    );

Map<String, dynamic> _$$MyInfoDTOImplToJson(_$MyInfoDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickName': instance.nickName,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'identifier': instance.identifier,
      'birthYear': instance.birthYear,
      'phoneAuthenticated': instance.phoneAuthenticated,
      'stateMessage': instance.stateMessage,
      'profileUrl': instance.profileUrl,
      'myProfilePath': instance.myProfilePath,
      'gold': instance.gold,
      'mannerPoint': instance.mannerPoint,
    };
