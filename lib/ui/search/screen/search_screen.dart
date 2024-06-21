import 'package:flutter/material.dart';

import '../../../core/constant/custom_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "SearchScreen",
        style: TextStyle(color: mainSilverColor),
      ),
    );
  }
}
