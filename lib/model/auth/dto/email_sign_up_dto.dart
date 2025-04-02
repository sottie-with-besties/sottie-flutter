import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_sign_up_dto.freezed.dart';

part 'email_sign_up_dto.g.dart';

@unfreezed
sealed class EmailSignUpDTO with _$EmailSignUpDTO {
  factory EmailSignUpDTO({
    String? email,
    String? password,
    String? name,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
    String? nickName,
  }) = _EmailSignUpDTO;

  factory EmailSignUpDTO.fromJson(Map<String, dynamic> json) =>
      _$EmailSignUpDTOFromJson(json);
}

final emailSignUp = EmailSignUpDTO();
