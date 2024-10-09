import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';

part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  factory TokenModel({
    required String refreshToken,
    required String accessToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}

@freezed
class AccessTokenModel with _$AccessTokenModel {
  factory AccessTokenModel({
    required String accessToken,
  }) = _AccessTokenModel;

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);
}
