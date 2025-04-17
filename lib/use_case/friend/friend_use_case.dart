import 'dart:developer';

import 'package:flutter/material.dart';

final class FriendUseCase {
  static final FriendUseCase _instance = FriendUseCase._();

  factory FriendUseCase() => _instance;

  FriendUseCase._();

  void friendAdd(BuildContext context) {
    log("friendAdd");
  }

  void friendDelete(BuildContext context) {
    log("friendDelete");
  }

  void friendSendDm(BuildContext context) {
    log("friendSendDm");
  }
}
