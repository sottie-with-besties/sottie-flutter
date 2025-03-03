import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_sign_up_model.freezed.dart';
part 'oauth_sign_up_model.g.dart';

@unfreezed
sealed class OauthSignUpModel with _$OauthSignUpModel {
  factory OauthSignUpModel({
    String? idToken,
    String? accessToken,
    String? name,
    String? phoneNumber,
    String? gender,
    String? identifier,
    String? birthYear,
    bool? phoneAuthenticated,
    String? nickName,
  }) = _OauthSignUpModel;

  factory OauthSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$OauthSignUpModelFromJson(json);
}

final oauthSignUp = OauthSignUpModel();
