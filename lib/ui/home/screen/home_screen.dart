import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/app_logo.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';
import 'package:sottie_flutter/ui/home/widget/home_content_screen.dart';
import 'package:sottie_flutter/ui/home/widget/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: Row(
        children: [
          const AppLogo(),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Sottie",
            style: GoogleFonts.jua(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: mainSilverColor,
            ),
          ),
        ],
      ),
      header: HomeHeader(),
      contentChild: HomeContentScreen(),
    );
  }
}
