import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBlueColor,
      width: 40,
      height: 40,
      child: const Center(
        child: Text(
          "로고",
          style: TextStyle(
            color: mainBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
