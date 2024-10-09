import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@unfreezed
class SignUpModel with _$SignUpModel {
  factory SignUpModel({
    String? name,
    String? email,
    String? nickName,
    String? password,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
