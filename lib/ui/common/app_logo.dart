import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: 40,
      height: 40,
      child: const Center(
        child: Text(
          "로고",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
