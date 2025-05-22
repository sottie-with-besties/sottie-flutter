import 'package:flutter/material.dart' show BuildContext, MediaQuery;

sealed class ScreenSize {
  static double _wu = 1;
  static double _hu = 1;

  static double _screenWidth = 1;
  static double _screenHeight = 1;

  static double get wu => _wu;

  static double get hu => _hu;

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static void initScreenSize(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    _wu = _screenWidth / 360;
    _hu = _screenHeight / 720;
  }
}
