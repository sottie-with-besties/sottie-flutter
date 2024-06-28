import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pinned: true,
      appBarHeight: 125,
      collapsedHeight: 60,
      appBarChild: Center(
        child: Column(
          children: [
            Text("Sottie1"),
          ],
        ),
      ),
      shellChild: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
