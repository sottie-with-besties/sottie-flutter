import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/auth/dto/oauth_sign_up_dto.dart';
import 'package:sottie_flutter/model/auth/dto/token_dto.dart';
import 'package:sottie_flutter/model/auth/entity/auth_type.dart';
import 'package:sottie_flutter/model/auth/entity/oauth_login_entity.dart';
import 'package:sottie_flutter/model/user/entity/my_info_entity.dart';
import 'package:sottie_flutter/repository/auth/implements/auth_dev_repository_impl.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_snackbar.dart';

import '../../core/local_database/token_storage.dart';

part 'auth_part/auth_email.dart';
part 'auth_part/oauth_apple.dart';
part 'auth_part/oauth_google.dart';
part 'auth_part/oauth_kakao.dart';

final _oauthLoginEntity = OauthLoginEntity();

final class AuthUseCase {
  static final AuthUseCase _instance = AuthUseCase._();

  factory AuthUseCase() => _instance;

  AuthUseCase._();

  final _tokenStorage = GetIt.I.get<TokenStorage>();

  Future<String?> signIn({
    required AuthType authType,
    String? email,
    String? password,
  }) async {
    String? errorCode;

    switch (authType) {
      case AuthType.email:
        try {
          await _emailLogin(email: email!, password: password!);
          errorCode = null;
        } catch (_) {
          errorCode = "이메일 로그인 에러가 발생하였습니다";
        }
        break;
      case AuthType.kakao:
        errorCode = await _signInWithKakao();
        break;
      case AuthType.google:
        errorCode = await _signInWithGoogle();
        break;
      case AuthType.apple:
        errorCode = await _signInWithApple();
        break;
    }

    return errorCode;
  }

  /// OAuth로 로그인하기 (카카오, 구글, 애플)
  Future<void> oauthLogin({
    required BuildContext context,
    required AuthType oauthType,
  }) async {
    try {
      final errorCode = await signIn(authType: oauthType);

      if (context.mounted) {
        if (errorCode == null) {
          // Todo: 백엔드로 ID 토큰과 액세스 토큰 전송
          log(_oauthLoginEntity.toJson().toString(), name: '백엔드로 토큰 전송');

          late TokenDTO oauthToken;

          // 이걸로 받았다고 가정
          final receivedTokens = TokenDTO(
            refreshToken: 'refreshToken',
            accessToken: 'accessToken',
          );

          /// 유저가 OAuth로 로그인 시도하였으나 회원가입이 안되어 있음
          if (receivedTokens.refreshToken == '') {
            oauthSignUp.idToken = _oauthLoginEntity.idToken;
            oauthSignUp.accessToken = _oauthLoginEntity.accessToken;

            context.push(
              '${CustomRouter.authPath}/${CustomRouter.certificationPath}',
              extra: {'isOauthSignUp': true},
            );
            // Todo: 백엔드로 OAuthSignUpEntity 보내기
            log(oauthSignUp.toJson().toString());

            // OAuthSignUpEntity 보내고 받은 토큰
            final receivedToken2 = TokenDTO(
              refreshToken: 'refreshToken',
              accessToken: 'accessToken',
            );
            oauthToken = receivedToken2;
          } else {
            oauthToken = receivedTokens;
          }

          /// 시큐어 스토리지에 토큰 저장
          await _tokenStorage.writeRefreshToken(
            newRefreshToken: oauthToken.refreshToken,
          );
          await _tokenStorage.writeAccessToken(
            newAccessToken: oauthToken.accessToken,
          );

          _tokenStorage.changeAccessToken(
            newAcessToken: oauthToken.accessToken,
          );

          /// 회원가입 또는 로그인 완료 후 홈으로 넘어가기
          if (context.mounted) {
            context.go(CustomRouter.homePath);
          }
        } else {
          /// 알 수 없는 에러
          showCustomSnackBar(context, errorCode);
        }
      }
    } on Exception catch (_) {
      if (context.mounted) {
        showCustomSnackBar(context, "알 수 없는 에러가 발생하였습니다");
      }
    }
  }

  /// 로그아웃
  Future<String?> signOut() async {
    String? errorCode;

    switch (authType) {
      case AuthType.email:
        errorCode = await _signOutEmail();
        break;
      case AuthType.kakao:
        errorCode = await _signOutKakao();
        break;
      case AuthType.google:
        errorCode = await _signOutGoogle();
        break;
      case AuthType.apple:
        errorCode = await _signOutApple();
        break;
      default:
        errorCode = null;
        break;
    }

    return errorCode;
  }
}
