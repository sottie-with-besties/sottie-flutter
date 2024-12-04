import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    /// 친구 ID
    required int id,

    /// 친구 닉네임
    required String nickname,

    /// 친구 상태 메세지
    required String? stateMsg,

    /// 프로필 URL, 프로필 없으면 id로 랜덤 아바타 생성
    required String? profileUrl,

    /// 매너온도
    required double mannerTemperature,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
