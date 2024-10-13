import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class OnLongPressOption extends StatelessWidget {
  const OnLongPressOption({
    super.key,
    required this.optionTitle,
    required this.onTap,
    required this.color,
    required this.icon,
  });

  final String optionTitle;
  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                optionTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mainWhiteSilverColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                icon,
                color: mainWhiteSilverColor,
                size: 24 * hu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
