// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyInfoDTO _$MyInfoDTOFromJson(Map<String, dynamic> json) {
  return _MyInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$MyInfoDTO {
  /// ID
  int get id => throw _privateConstructorUsedError;

  /// ID
  set id(int value) => throw _privateConstructorUsedError;

  /// 실명
  String get name => throw _privateConstructorUsedError;

  /// 실명
  set name(String value) => throw _privateConstructorUsedError;

  /// 이메일
  String get email => throw _privateConstructorUsedError;

  /// 이메일
  set email(String value) => throw _privateConstructorUsedError;

  /// 닉네임
  String get nickName => throw _privateConstructorUsedError;

  /// 닉네임
  set nickName(String value) => throw _privateConstructorUsedError;

  /// 패스워드
  String get password => throw _privateConstructorUsedError;

  /// 패스워드
  set password(String value) => throw _privateConstructorUsedError;

  /// 핸드폰 번호
  String get phoneNumber => throw _privateConstructorUsedError;

  /// 핸드폰 번호
  set phoneNumber(String value) => throw _privateConstructorUsedError;

  /// 성별
  String get gender => throw _privateConstructorUsedError;

  /// 성별
  set gender(String value) => throw _privateConstructorUsedError;

  /// 식별 번호
  String get identifier => throw _privateConstructorUsedError;

  /// 식별 번호
  set identifier(String value) => throw _privateConstructorUsedError;

  /// 생일
  String get birthYear => throw _privateConstructorUsedError;

  /// 생일
  set birthYear(String value) => throw _privateConstructorUsedError;

  /// 본인 인증 여부
  bool get phoneAuthenticated => throw _privateConstructorUsedError;

  /// 본인 인증 여부
  set phoneAuthenticated(bool value) => throw _privateConstructorUsedError;

  /// 상태 메세지
  String? get stateMessage => throw _privateConstructorUsedError;

  /// 상태 메세지
  set stateMessage(String? value) => throw _privateConstructorUsedError;

  /// 프로필 Url
  String? get profileUrl => throw _privateConstructorUsedError;

  /// 프로필 Url
  set profileUrl(String? value) => throw _privateConstructorUsedError;

  /// 프로필 Path => 긍정적 캐시
  String? get myProfilePath => throw _privateConstructorUsedError;

  /// 프로필 Path => 긍정적 캐시
  set myProfilePath(String? value) => throw _privateConstructorUsedError;

  /// 골드 -> 화폐 이름 임시 지정
  int get gold => throw _privateConstructorUsedError;

  /// 골드 -> 화폐 이름 임시 지정
  set gold(int value) => throw _privateConstructorUsedError;

  /// 매너 온도
  double get mannerPoint => throw _privateConstructorUsedError;

  /// 매너 온도
  set mannerPoint(double value) => throw _privateConstructorUsedError;

  /// Serializes this MyInfoDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyInfoDTOCopyWith<MyInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyInfoDTOCopyWith<$Res> {
  factory $MyInfoDTOCopyWith(MyInfoDTO value, $Res Function(MyInfoDTO) then) =
      _$MyInfoDTOCopyWithImpl<$Res, MyInfoDTO>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String nickName,
      String password,
      String phoneNumber,
      String gender,
      String identifier,
      String birthYear,
      bool phoneAuthenticated,
      String? stateMessage,
      String? profileUrl,
      String? myProfilePath,
      int gold,
      double mannerPoint});
}

/// @nodoc
class _$MyInfoDTOCopyWithImpl<$Res, $Val extends MyInfoDTO>
    implements $MyInfoDTOCopyWith<$Res> {
  _$MyInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? nickName = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? gender = null,
    Object? identifier = null,
    Object? birthYear = null,
    Object? phoneAuthenticated = null,
    Object? stateMessage = freezed,
    Object? profileUrl = freezed,
    Object? myProfilePath = freezed,
    Object? gold = null,
    Object? mannerPoint = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      birthYear: null == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as String,
      phoneAuthenticated: null == phoneAuthenticated
          ? _value.phoneAuthenticated
          : phoneAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      stateMessage: freezed == stateMessage
          ? _value.stateMessage
          : stateMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      myProfilePath: freezed == myProfilePath
          ? _value.myProfilePath
          : myProfilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gold: null == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int,
      mannerPoint: null == mannerPoint
          ? _value.mannerPoint
          : mannerPoint // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyInfoDTOImplCopyWith<$Res>
    implements $MyInfoDTOCopyWith<$Res> {
  factory _$$MyInfoDTOImplCopyWith(
          _$MyInfoDTOImpl value, $Res Function(_$MyInfoDTOImpl) then) =
      __$$MyInfoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String nickName,
      String password,
      String phoneNumber,
      String gender,
      String identifier,
      String birthYear,
      bool phoneAuthenticated,
      String? stateMessage,
      String? profileUrl,
      String? myProfilePath,
      int gold,
      double mannerPoint});
}

/// @nodoc
class __$$MyInfoDTOImplCopyWithImpl<$Res>
    extends _$MyInfoDTOCopyWithImpl<$Res, _$MyInfoDTOImpl>
    implements _$$MyInfoDTOImplCopyWith<$Res> {
  __$$MyInfoDTOImplCopyWithImpl(
      _$MyInfoDTOImpl _value, $Res Function(_$MyInfoDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? nickName = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? gender = null,
    Object? identifier = null,
    Object? birthYear = null,
    Object? phoneAuthenticated = null,
    Object? stateMessage = freezed,
    Object? profileUrl = freezed,
    Object? myProfilePath = freezed,
    Object? gold = null,
    Object? mannerPoint = null,
  }) {
    return _then(_$MyInfoDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      birthYear: null == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as String,
      phoneAuthenticated: null == phoneAuthenticated
          ? _value.phoneAuthenticated
          : phoneAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      stateMessage: freezed == stateMessage
          ? _value.stateMessage
          : stateMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      myProfilePath: freezed == myProfilePath
          ? _value.myProfilePath
          : myProfilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      gold: null == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int,
      mannerPoint: null == mannerPoint
          ? _value.mannerPoint
          : mannerPoint // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyInfoDTOImpl implements _MyInfoDTO {
  _$MyInfoDTOImpl(
      {this.id = 45152341245,
      this.name = '김진표',
      this.email = 'kasdasdasd7@gmail.com',
      this.nickName = '나의 닉네임',
      this.password = '12343456778',
      this.phoneNumber = '01011111111',
      this.gender = 'MALE',
      this.identifier = '123123123',
      this.birthYear = '1111년 1월 1일',
      this.phoneAuthenticated = false,
      this.stateMessage,
      this.profileUrl,
      this.myProfilePath,
      this.gold = 0,
      this.mannerPoint = 36.5});

  factory _$MyInfoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyInfoDTOImplFromJson(json);

  /// ID
  @override
  @JsonKey()
  int id;

  /// 실명
  @override
  @JsonKey()
  String name;

  /// 이메일
  @override
  @JsonKey()
  String email;

  /// 닉네임
  @override
  @JsonKey()
  String nickName;

  /// 패스워드
  @override
  @JsonKey()
  String password;

  /// 핸드폰 번호
  @override
  @JsonKey()
  String phoneNumber;

  /// 성별
  @override
  @JsonKey()
  String gender;

  /// 식별 번호
  @override
  @JsonKey()
  String identifier;

  /// 생일
  @override
  @JsonKey()
  String birthYear;

  /// 본인 인증 여부
  @override
  @JsonKey()
  bool phoneAuthenticated;

  /// 상태 메세지
  @override
  String? stateMessage;

  /// 프로필 Url
  @override
  String? profileUrl;

  /// 프로필 Path => 긍정적 캐시
  @override
  String? myProfilePath;

  /// 골드 -> 화폐 이름 임시 지정
  @override
  @JsonKey()
  int gold;

  /// 매너 온도
  @override
  @JsonKey()
  double mannerPoint;

  @override
  String toString() {
    return 'MyInfoDTO(id: $id, name: $name, email: $email, nickName: $nickName, password: $password, phoneNumber: $phoneNumber, gender: $gender, identifier: $identifier, birthYear: $birthYear, phoneAuthenticated: $phoneAuthenticated, stateMessage: $stateMessage, profileUrl: $profileUrl, myProfilePath: $myProfilePath, gold: $gold, mannerPoint: $mannerPoint)';
  }

  /// Create a copy of MyInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyInfoDTOImplCopyWith<_$MyInfoDTOImpl> get copyWith =>
      __$$MyInfoDTOImplCopyWithImpl<_$MyInfoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyInfoDTOImplToJson(
      this,
    );
  }
}

abstract class _MyInfoDTO implements MyInfoDTO {
  factory _MyInfoDTO(
      {int id,
      String name,
      String email,
      String nickName,
      String password,
      String phoneNumber,
      String gender,
      String identifier,
      String birthYear,
      bool phoneAuthenticated,
      String? stateMessage,
      String? profileUrl,
      String? myProfilePath,
      int gold,
      double mannerPoint}) = _$MyInfoDTOImpl;

  factory _MyInfoDTO.fromJson(Map<String, dynamic> json) =
      _$MyInfoDTOImpl.fromJson;

  /// ID
  @override
  int get id;

  /// ID
  set id(int value);

  /// 실명
  @override
  String get name;

  /// 실명
  set name(String value);

  /// 이메일
  @override
  String get email;

  /// 이메일
  set email(String value);

  /// 닉네임
  @override
  String get nickName;

  /// 닉네임
  set nickName(String value);

  /// 패스워드
  @override
  String get password;

  /// 패스워드
  set password(String value);

  /// 핸드폰 번호
  @override
  String get phoneNumber;

  /// 핸드폰 번호
  set phoneNumber(String value);

  /// 성별
  @override
  String get gender;

  /// 성별
  set gender(String value);

  /// 식별 번호
  @override
  String get identifier;

  /// 식별 번호
  set identifier(String value);

  /// 생일
  @override
  String get birthYear;

  /// 생일
  set birthYear(String value);

  /// 본인 인증 여부
  @override
  bool get phoneAuthenticated;

  /// 본인 인증 여부
  set phoneAuthenticated(bool value);

  /// 상태 메세지
  @override
  String? get stateMessage;

  /// 상태 메세지
  set stateMessage(String? value);

  /// 프로필 Url
  @override
  String? get profileUrl;

  /// 프로필 Url
  set profileUrl(String? value);

  /// 프로필 Path => 긍정적 캐시
  @override
  String? get myProfilePath;

  /// 프로필 Path => 긍정적 캐시
  set myProfilePath(String? value);

  /// 골드 -> 화폐 이름 임시 지정
  @override
  int get gold;

  /// 골드 -> 화폐 이름 임시 지정
  set gold(int value);

  /// 매너 온도
  @override
  double get mannerPoint;

  /// 매너 온도
  set mannerPoint(double value);

  /// Create a copy of MyInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyInfoDTOImplCopyWith<_$MyInfoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
