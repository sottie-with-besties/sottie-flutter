import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/default_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        pinned: true,
        appBarChild: Text("Search"),
        shellChild: Text("Search Screen"));
  }
}
