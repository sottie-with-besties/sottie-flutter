import 'dart:developer';

import 'package:flutter/material.dart';

sealed class FriendUseCase {
  static void friendAdd(BuildContext context) {
    log("friendAdd");
  }

  static void friendDelete(BuildContext context) {
    log("friendDelete");
  }

  static void friendSendDm(BuildContext context) {
    log("friendSendDm");
  }
}
