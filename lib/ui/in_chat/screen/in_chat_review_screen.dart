import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class InChatReviewScreen extends StatelessWidget {
  const InChatReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              log("완료");
            },
            child: const Text(
              "완료",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: mainBlackColor,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("리뷰 스크린"),
      ),
    );
  }
}
