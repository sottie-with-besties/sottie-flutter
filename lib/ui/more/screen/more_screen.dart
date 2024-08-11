import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/more/screen/more_content_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      hasScrollBody: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: AppBarTitle(
          title: '내 정보',
        ),
      ),
      contentChild: MoreContentScreen(),
    );
  }
}
