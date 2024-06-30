import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class DmScreen extends StatelessWidget {
  const DmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasScrollBody: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: AppBarTitle(
          title: 'DM',
        ),
      ),
      contentChild: Text("DM Screen"),
    );
  }
}
