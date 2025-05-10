// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenDTOImpl _$$TokenDTOImplFromJson(Map<String, dynamic> json) =>
    _$TokenDTOImpl(
      refreshToken: json['refreshToken'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$TokenDTOImplToJson(_$TokenDTOImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };

_$AccessTokenDTOImpl _$$AccessTokenDTOImplFromJson(Map<String, dynamic> json) =>
    _$AccessTokenDTOImpl(
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$AccessTokenDTOImplToJson(
        _$AccessTokenDTOImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };
