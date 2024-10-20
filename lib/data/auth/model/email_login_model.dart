import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_login_model.freezed.dart';
part 'email_login_model.g.dart';

@unfreezed
class EmailLoginModel with _$EmailLoginModel {
  factory EmailLoginModel({
    String? email,
    String? password,
  }) = _EmailLoginModel;

  factory EmailLoginModel.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginModelFromJson(json);
}
