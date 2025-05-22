part of '../auth_use_case.dart';

sealed class _AppleAuth {
  static Future<List<dynamic>> signInWithApple() async {
    return [true, "No Apple Login"];
  }

  static Future<bool> signOutApple() async {
    /// Todo: 애플 로그인 로그아웃 하는 코드

    try {
      return true;
    } catch (_) {
      return false;
    }
  }
}
