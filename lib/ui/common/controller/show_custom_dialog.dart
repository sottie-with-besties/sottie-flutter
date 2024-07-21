import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

void showCustomDialog(BuildContext context, Widget customChild) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, a1, a2) => Container(),
    transitionDuration: const Duration(milliseconds: 100),
    transitionBuilder: (context, a1, a2, child) {
      return ScaleTransition(
        scale: a1,
        child: AlertDialog(
          scrollable: true,
          content: SizedBox(
            width: 250 * wu,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: customChild,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "확인",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mainSilverColor,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
