import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_login_model.freezed.dart';
part 'oauth_login_model.g.dart';

@unfreezed
class OauthLoginModel with _$OauthLoginModel {
  factory OauthLoginModel({
    String? idToken,
    String? accessToken,
    String? name,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
    String? nickName,
  }) = _OauthLoginModel;

  factory OauthLoginModel.fromJson(Map<String, dynamic> json) =>
      _$OauthLoginModelFromJson(json);
}
