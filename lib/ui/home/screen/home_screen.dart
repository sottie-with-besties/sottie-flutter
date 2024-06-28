import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pinned: true,
      appBarChild: Center(
        child: Text("Sottie1"),
      ),
      shellChild: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
