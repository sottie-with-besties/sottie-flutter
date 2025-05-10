// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailSignUpDTOImpl _$$EmailSignUpDTOImplFromJson(Map<String, dynamic> json) =>
    _$EmailSignUpDTOImpl(
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      identifier: json['identifier'] as String?,
      birthYear: json['birthYear'] as String?,
      phoneAuthenticated: json['phoneAuthenticated'] as bool?,
      nickName: json['nickName'] as String?,
    );

Map<String, dynamic> _$$EmailSignUpDTOImplToJson(
        _$EmailSignUpDTOImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'identifier': instance.identifier,
      'birthYear': instance.birthYear,
      'phoneAuthenticated': instance.phoneAuthenticated,
      'nickName': instance.nickName,
    };
