import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
sealed class UserDTO with _$UserDTO {
  factory UserDTO({
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
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
