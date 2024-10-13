import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.jua(
        fontWeight: FontWeight.bold,
        fontSize: 38,
        color: mainBlackColor,
      ),
    );
  }
}
