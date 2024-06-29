import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: Text(
        "검색하기",
        style: GoogleFonts.jua(
          color: mainSilverColor,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      contentChild: Text("Search Screen"),
    );
  }
}
