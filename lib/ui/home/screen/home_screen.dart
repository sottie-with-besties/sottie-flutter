import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/app_logo.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';
import 'package:sottie_flutter/ui/home/widget/home_content_screen.dart';
import 'package:sottie_flutter/ui/home/widget/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasScrollBody: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const AppLogo(),
            const SizedBox(
              width: 15,
            ),
            AppBarTitle(title: 'Sottie'),
          ],
        ),
      ),
      header: HomeHeader(),
      contentChild: HomeContentScreen(),
    );
  }
}
