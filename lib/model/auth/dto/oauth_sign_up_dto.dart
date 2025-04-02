import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_sign_up_dto.freezed.dart';

part 'oauth_sign_up_dto.g.dart';

@unfreezed
sealed class OauthSignUpDTO with _$OauthSignUpDTO {
  factory OauthSignUpDTO({
    String? idToken,
    String? accessToken,
    String? name,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
    String? nickName,
  }) = _OauthSignUpDTO;

  factory OauthSignUpDTO.fromJson(Map<String, dynamic> json) =>
      _$OauthSignUpDTOFromJson(json);
}

final oauthSignUp = OauthSignUpDTO();
