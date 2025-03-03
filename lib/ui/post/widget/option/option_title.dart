import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class OptionTitle extends StatelessWidget {
  const OptionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 14 * wu, fontWeight: FontWeight.bold),
    );
  }
}
