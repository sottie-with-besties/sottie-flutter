import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LogIn {
  final String? email;
  final String? password;

  LogIn({required this.email, required this.password});

  factory LogIn.fromJson(Map<String, dynamic> json) => _$LogInFromJson(json);
  Map<String, dynamic> toJson() => _$LogInToJson(this);
}