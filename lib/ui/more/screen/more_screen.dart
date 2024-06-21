import 'package:flutter/material.dart';

import '../../../core/constant/custom_colors.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "MoreScreen",
        style: TextStyle(color: mainSilverColor),
      ),
    );
  }
}
