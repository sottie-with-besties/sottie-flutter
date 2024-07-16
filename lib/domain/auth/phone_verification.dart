import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

String? _verificationId;

// 이 함수를 실행하면 로봇인지 아닌지 체크하는 웹 사이트가 열리고 다시 웹이 닫히면 SMS 코드 문자 발송
Future<String?> signInWithPhoneNumber(String number) async {
  String? errorCode;

  await _auth.verifyPhoneNumber(
    phoneNumber: "+82 $number",
    verificationCompleted: (PhoneAuthCredential credential) {
      log("credential :: $credential");
    },
    verificationFailed: (FirebaseAuthException exception) {
      errorCode = "에러가 발생했습니다. Error Code: ${exception.code}";
    },
    codeSent: (String verificationId, int? resendToken) {
      _verificationId = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      errorCode = "시간 경과로 인해 실패하였습니다.";
    },
  );

  return errorCode;
}

// 발송된 SMS 코드와 함께 로그인 하여 문제가 없으면 폰 인증 완료.
Future<String?> signInWithSmsCode(String code) async {
  String? errorCode;

  try {
    if (_verificationId != null) {
      PhoneAuthCredential phoneCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: code);
      await _auth.signInWithCredential(phoneCredential);
      errorCode = null;
    } else {
      errorCode = "핸드폰 인증을 다시 진행해주세요.";
    }
  } on FirebaseAuthException catch (error) {
    errorCode = "에러가 발생하였습니다. Error Code: ${error.code}";
  }

  return errorCode;
}

// 핸드폰 인증만 하면 되기 때문에 유저를 파이어베이스에 저장하지 않고 삭제한다.
Future<void> deletePhoneUser(String code) async {
  await _auth.currentUser!.delete();
}
