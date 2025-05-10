// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenDTO _$TokenDTOFromJson(Map<String, dynamic> json) {
  return _TokenDTO.fromJson(json);
}

/// @nodoc
mixin _$TokenDTO {
  String get refreshToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  /// Serializes this TokenDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenDTOCopyWith<TokenDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDTOCopyWith<$Res> {
  factory $TokenDTOCopyWith(TokenDTO value, $Res Function(TokenDTO) then) =
      _$TokenDTOCopyWithImpl<$Res, TokenDTO>;
  @useResult
  $Res call({String refreshToken, String accessToken});
}

/// @nodoc
class _$TokenDTOCopyWithImpl<$Res, $Val extends TokenDTO>
    implements $TokenDTOCopyWith<$Res> {
  _$TokenDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDTOImplCopyWith<$Res>
    implements $TokenDTOCopyWith<$Res> {
  factory _$$TokenDTOImplCopyWith(
          _$TokenDTOImpl value, $Res Function(_$TokenDTOImpl) then) =
      __$$TokenDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken, String accessToken});
}

/// @nodoc
class __$$TokenDTOImplCopyWithImpl<$Res>
    extends _$TokenDTOCopyWithImpl<$Res, _$TokenDTOImpl>
    implements _$$TokenDTOImplCopyWith<$Res> {
  __$$TokenDTOImplCopyWithImpl(
      _$TokenDTOImpl _value, $Res Function(_$TokenDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_$TokenDTOImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenDTOImpl implements _TokenDTO {
  _$TokenDTOImpl({required this.refreshToken, required this.accessToken});

  factory _$TokenDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenDTOImplFromJson(json);

  @override
  final String refreshToken;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'TokenDTO(refreshToken: $refreshToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDTOImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, accessToken);

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDTOImplCopyWith<_$TokenDTOImpl> get copyWith =>
      __$$TokenDTOImplCopyWithImpl<_$TokenDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenDTOImplToJson(
      this,
    );
  }
}

abstract class _TokenDTO implements TokenDTO {
  factory _TokenDTO(
      {required final String refreshToken,
      required final String accessToken}) = _$TokenDTOImpl;

  factory _TokenDTO.fromJson(Map<String, dynamic> json) =
      _$TokenDTOImpl.fromJson;

  @override
  String get refreshToken;
  @override
  String get accessToken;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenDTOImplCopyWith<_$TokenDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccessTokenDTO _$AccessTokenDTOFromJson(Map<String, dynamic> json) {
  return _AccessTokenDTO.fromJson(json);
}

/// @nodoc
mixin _$AccessTokenDTO {
  String get accessToken => throw _privateConstructorUsedError;

  /// Serializes this AccessTokenDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessTokenDTOCopyWith<AccessTokenDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTokenDTOCopyWith<$Res> {
  factory $AccessTokenDTOCopyWith(
          AccessTokenDTO value, $Res Function(AccessTokenDTO) then) =
      _$AccessTokenDTOCopyWithImpl<$Res, AccessTokenDTO>;
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class _$AccessTokenDTOCopyWithImpl<$Res, $Val extends AccessTokenDTO>
    implements $AccessTokenDTOCopyWith<$Res> {
  _$AccessTokenDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessTokenDTOImplCopyWith<$Res>
    implements $AccessTokenDTOCopyWith<$Res> {
  factory _$$AccessTokenDTOImplCopyWith(_$AccessTokenDTOImpl value,
          $Res Function(_$AccessTokenDTOImpl) then) =
      __$$AccessTokenDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class __$$AccessTokenDTOImplCopyWithImpl<$Res>
    extends _$AccessTokenDTOCopyWithImpl<$Res, _$AccessTokenDTOImpl>
    implements _$$AccessTokenDTOImplCopyWith<$Res> {
  __$$AccessTokenDTOImplCopyWithImpl(
      _$AccessTokenDTOImpl _value, $Res Function(_$AccessTokenDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccessTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$AccessTokenDTOImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessTokenDTOImpl implements _AccessTokenDTO {
  _$AccessTokenDTOImpl({required this.accessToken});

  factory _$AccessTokenDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessTokenDTOImplFromJson(json);

  @override
  final String accessToken;

  @override
  String toString() {
    return 'AccessTokenDTO(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessTokenDTOImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of AccessTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessTokenDTOImplCopyWith<_$AccessTokenDTOImpl> get copyWith =>
      __$$AccessTokenDTOImplCopyWithImpl<_$AccessTokenDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessTokenDTOImplToJson(
      this,
    );
  }
}

abstract class _AccessTokenDTO implements AccessTokenDTO {
  factory _AccessTokenDTO({required final String accessToken}) =
      _$AccessTokenDTOImpl;

  factory _AccessTokenDTO.fromJson(Map<String, dynamic> json) =
      _$AccessTokenDTOImpl.fromJson;

  @override
  String get accessToken;

  /// Create a copy of AccessTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessTokenDTOImplCopyWith<_$AccessTokenDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
