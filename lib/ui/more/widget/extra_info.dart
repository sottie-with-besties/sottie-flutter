import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    super.key,
    required this.subTitle,
    required this.valueChild,
  });

  final String subTitle;
  final Widget valueChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 50 * hu,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 * hu),
            ),
            valueChild,
          ],
        ),
      ),
    );
  }
}
