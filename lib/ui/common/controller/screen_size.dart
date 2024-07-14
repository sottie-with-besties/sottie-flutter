import 'package:flutter/cupertino.dart';

sealed class ScreenSize {
  static double? width = 0;
  static double? height = 0;

  static void initSize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
