import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.children,
  });

  final String title;
  final String? subTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11 * ScreenSize.hu,
          ),
        ),
        subtitle:
            subTitle == null
                ? null
                : Text(
                  subTitle!,
                  style: TextStyle(fontSize: 9 * ScreenSize.hu),
                ),
        trailing: const Icon(Icons.arrow_drop_down),
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.all(16),
        shape: const Border(),
        children: children,
      ),
    );
  }
}
