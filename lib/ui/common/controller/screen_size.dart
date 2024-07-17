import 'package:flutter/cupertino.dart';

sealed class ScreenSize {
  static double width = 1;
  static double height = 1;

  // 넓이, 높이 길이 단위를 정해서 반응형 UI 구현
  static double widthUnit = 1;
  static double heightUnit = 1;

  static void initSize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    // 길이 단위 결정
    widthUnit = width / 15;
    heightUnit = height / 20;
  }
}
