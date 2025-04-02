import 'dart:developer';

import 'package:flutter/material.dart';

final class UserUseCase {
  void userBlock(BuildContext context) {
    log("userBlock");
  }

  void userUnblock(BuildContext context) {
    log("userUnblock");
  }

  void userReport(BuildContext context) {
    log("userReport");
  }

  void getMyInfo() {
    // Todo: 내 정보 받아오는 코드

    // if (이자르 데이터베이스에 내 정보가 있으면) => myInfoEntity에 받아오기
    // else => 서버로부터 내 정보 받아오기
  }

  void pushMyInfo() {
    // Todo: 내 정보 백엔드로 보내는 코드

    // 내 정보 변경 시 서버에 보내기
  }
}
