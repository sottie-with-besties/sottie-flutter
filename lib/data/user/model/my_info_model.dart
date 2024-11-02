import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_info_model.freezed.dart';
part 'my_info_model.g.dart';

@unfreezed
class MyInfoModel with _$MyInfoModel {
  factory MyInfoModel({
    /// ID
    @Default('45152341245') String id,

    /// 실명
    @Default('김진표') String name,

    /// 이메일
    @Default('kjp00552277@gmail.com') String email,

    /// 닉네임
    @Default('나의 닉네임') String nickName,

    /// 패스워드
    @Default('12343456778') String password,

    /// 핸드폰 번호
    @Default('01035361901') String phoneNumber,

    /// 성별
    @Default('MALE') String gender,

    /// 식별 번호
    @Default('123123123') String identifier,

    /// 생일
    @Default('2000년 5월 27일') String birthYear,

    /// 본인 인증 여부
    @Default(false) bool phoneAuthenticated,

    /// 상태 메세지
    String? stateMessage,

    /// 프로필 Url
    String? profileUrl,

    /// 프로필 Path => 긍정 캐시
    String? myProfilePath,

    /// 골드 -> 화폐 이름 임시 지정
    @Default(0) int gold,

    /// 매너 온도
    @Default(36.5) double mannerPoint,
  }) = _MyInfoModel;

  factory MyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoModelFromJson(json);
}
