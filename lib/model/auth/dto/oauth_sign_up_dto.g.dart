// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OauthSignUpDTOImpl _$$OauthSignUpDTOImplFromJson(Map<String, dynamic> json) =>
    _$OauthSignUpDTOImpl(
      idToken: json['idToken'] as String?,
      accessToken: json['accessToken'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      identifier: json['identifier'] as String?,
      birthYear: json['birthYear'] as String?,
      phoneAuthenticated: json['phoneAuthenticated'] as bool?,
      nickName: json['nickName'] as String?,
    );

Map<String, dynamic> _$$OauthSignUpDTOImplToJson(
        _$OauthSignUpDTOImpl instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'identifier': instance.identifier,
      'birthYear': instance.birthYear,
      'phoneAuthenticated': instance.phoneAuthenticated,
      'nickName': instance.nickName,
    };
