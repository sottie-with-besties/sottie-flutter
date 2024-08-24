import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class FriendTypeBox extends StatelessWidget {
  const FriendTypeBox({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 240 * wu,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: LocalTextField(
              prefixIcon: false,
              keyboardType: TextInputType.multiline,
              hint: "내용을 입력하세요.",
              focusNode: focusNode,
              suffixIcon: GestureDetector(
                onTap: () {
                  log("사진 및 동영상 고르기");
                },
                child: const Icon(
                  Icons.photo,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("메세지 전송");
          },
          child: Container(
            decoration: BoxDecoration(
              color: mainSilverColor,
              borderRadius: BorderRadius.circular(5),
            ),
            width: 35 * wu,
            height: 35 * hu,
            padding: const EdgeInsets.all(5),
            child: const FittedBox(
              child: Icon(
                Icons.send,
                color: Colors.blueAccent,
              ),
            ),
          ),
        )
      ],
    );
  }
}
