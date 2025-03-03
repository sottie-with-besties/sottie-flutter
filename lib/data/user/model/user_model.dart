import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    /// 유저 ID
    required int id,

    /// 유저 닉네임
    required String nickname,

    /// 유저 상태 메세지
    required String? stateMsg,

    /// 유저 프로필 URL
    required String? profileUrl,

    /// 매너온도
    required double mannerTemperature,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
