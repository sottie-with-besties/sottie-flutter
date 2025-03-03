import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_review.dart';

class InChatReviewScreen extends StatelessWidget {
  const InChatReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showCustomDialog(
                context,
                const Column(
                  children: [
                    Text("리뷰를 작성하시겠습니까?"),
                    Text("(리뷰를 한 번 완료하면 취소할 수 없습니다)"),
                  ],
                ),
                extraButton: ElevatedButton(
                  onPressed: () {
                    log("완료");
                    context.pop();
                    context.pop();
                  },
                  child: const Text("완료"),
                ),
              );
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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InChatReview(
              profileUrl: '1234',
              nickName: '닉네임1',
              guideArrowOn: true,
            ),
            InChatReview(profileUrl: '12345', nickName: '닉네임2'),
            InChatReview(profileUrl: '12346', nickName: '닉네임3'),
          ],
        ),
      ),
    );
  }
}
