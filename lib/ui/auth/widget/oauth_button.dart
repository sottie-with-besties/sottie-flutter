import 'package:flutter/material.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({
    super.key,
    required this.imgPath,
    required this.onPressed,
  });

  final String imgPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SizedBox(
          child: Image.asset(
            imgPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
