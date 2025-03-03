import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_sign_up_model.freezed.dart';
part 'email_sign_up_model.g.dart';

@unfreezed
sealed class EmailSignUpModel with _$EmailSignUpModel {
  factory EmailSignUpModel({
    String? email,
    String? password,
    String? name,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
    String? nickName,
  }) = _EmailSignUpModel;

  factory EmailSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$EmailSignUpModelFromJson(json);
}

final emailSignUp = EmailSignUpModel();
