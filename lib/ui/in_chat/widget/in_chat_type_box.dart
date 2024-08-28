import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class InChatTypeBox extends StatelessWidget {
  const InChatTypeBox({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: LocalTextField(
                borderRadius: 0,
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
            height: 60,
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
