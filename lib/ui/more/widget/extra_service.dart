import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ExtraService extends StatelessWidget {
  const ExtraService({
    super.key,
    required this.serviceName,
    required this.serviceIcon,
    required this.onTap,
  });

  final String serviceName;
  final IconData serviceIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 80 * wu,
        height: 100 * hu,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(serviceIcon, size: 26 * hu),
            SizedBox(height: 5 * hu),
            FittedBox(
              child: Text(
                serviceName,
                style: TextStyle(
                  fontSize: 14 * hu,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
