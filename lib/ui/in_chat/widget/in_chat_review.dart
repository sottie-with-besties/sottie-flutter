import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class InChatReview extends StatefulWidget {
  const InChatReview({super.key});

  @override
  State<InChatReview> createState() => _InChatReviewState();
}

class _InChatReviewState extends State<InChatReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide()),
        gradient: LinearGradient(
          colors: [
            mainGreenColor,
            mainWhiteSilverColor,
            mainWhiteSilverColor,
            mainWhiteSilverColor,
            mainRedColor,
          ],
        ),
      ),
      height: 80 * hu,
    );
  }
}
