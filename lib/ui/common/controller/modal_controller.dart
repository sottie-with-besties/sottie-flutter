import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

import 'screen_size.dart';

sealed class ModalController {
  static void showCustomModalBottomSheet(BuildContext context, Widget screen) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      backgroundColor: AppColors.whiteSilverColor,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return Container(
          width: ScreenSize.screenWidth,
          height: ScreenSize.screenHeight * 0.5,
          decoration: const BoxDecoration(color: AppColors.whiteSilverColor),
          child: screen,
        );
      },
    );
  }

  static Future<void> showCustomDialog(
    BuildContext context,
    Widget customChild, {
    Color? color,
    Widget? extraButton,
  }) async {
    await showGeneralDialog(
      context: context,
      pageBuilder: (context, a1, a2) => Container(),
      transitionDuration: const Duration(milliseconds: 100),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: a1,
          child: AlertDialog(
            backgroundColor: color,
            scrollable: true,
            content: SizedBox(
              width: 250 * ScreenSize.wu,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: customChild,
              ),
            ),
            actions: [
              if (extraButton != null) extraButton,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: const Text("닫기"),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCustomSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
