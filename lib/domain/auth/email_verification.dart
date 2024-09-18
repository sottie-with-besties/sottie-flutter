import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

/// 이메일 인증읠 위해서 먼저 계정을 만들어야함
Future<String?> createEmailAndPassword(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return null;
  } on FirebaseAuthException catch (error) {
    late String errorCode;
    switch (error.code) {
      case "email-already-in-use":
        errorCode = '이미 사용중인 이메일입니다.';
        break;
      case "invalid-email":
        errorCode = '유효하지 않는 이메일입니다.';
        break;
      case "weak-password":
        errorCode = '패스워드 안전성이 낮습니다.';
        break;
      case "operation-not-allowed":
        errorCode = error.code;
        break;
      default:
        errorCode = '알 수 없는 에러가 발생했습니다.';
    }
    return errorCode;
  }
}

/// 이메일 인증 보내기
Future<String?> sendEmailVerification() async {
  try {
    await _auth.currentUser!.sendEmailVerification();
    return null;
  } on FirebaseAuthException catch (e) {
    return "이메일 인증 과정 중 에러가 발생했습니다. 다시 시도해주세요. Error Code: ${e.code}";
  }
}

/// 이메일 인증 여부
Future<bool> isEmailVerification(String email, String password) async {
  /// 파이어베이스의 속성값이 업데이트 되기 위해서는 한번 더 로그인을 진행해주어야 한다.
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on Exception catch (_) {
    return false;
  }
  return _auth.currentUser == null ? false : _auth.currentUser!.emailVerified;
}

/// 이메일 인증만 하면 되기 때문에 유저를 파이어베이스에 저장하지 않고 삭제한다.
Future<String?> deleteEmailUser(String email, String password) async {
  try {
    /// 한번 더 로그인을 진행해주어야 삭제 가능.
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    await _auth.currentUser!.delete();
    return null;
  } on FirebaseAuthException catch (e) {
    return "알 수 없는 에러 Error Code: ${e.code}";
  }
}
