import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        pinned: true,
        appBarHeight: 120,
        collapsedHeight: 60,
        appBarChild: Text("Search"),
        shellChild: Text("Search Screen"));
  }
}
