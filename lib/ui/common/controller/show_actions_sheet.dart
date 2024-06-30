import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

void searchSheet(BuildContext context, Widget screen) {
  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    barrierColor: mainBrownColor,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: mainSilverColor,
        ),
        child: screen,
      );
    },
  );
}
