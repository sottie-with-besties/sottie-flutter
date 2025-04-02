import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.freezed.dart';

part 'token_dto.g.dart';

@freezed
sealed class TokenDTO with _$TokenDTO {
  factory TokenDTO({
    required String refreshToken,
    required String accessToken,
  }) = _TokenDTO;

  factory TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);
}

@freezed
sealed class AccessTokenDTO with _$AccessTokenDTO {
  factory AccessTokenDTO({required String accessToken}) = _AccessTokenDTO;

  factory AccessTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenDTOFromJson(json);
}
