import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
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
          child: LocalTextField(
            enabledBorder: false,
            focusBorder: false,
            borderRadius: 0,
            prefixIcon: false,
            keyboardType: TextInputType.multiline,
            hint: "내용을 입력하세요.",
            focusNode: focusNode,
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    log("사진 및 동영상 고르기");
                  },
                  child: const Icon(
                    Icons.photo,
                  ),
                ),
                SizedBox(width: 15 * wu),
                GestureDetector(
                  onTap: () {
                    log("메세지 전송");
                  },
                  child: Container(
                    height: 40 * hu,
                    color: mainBlueColor,
                    padding: const EdgeInsets.all(5),
                    child: const FittedBox(
                      child: Icon(
                        Icons.send,
                        color: mainSilverColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
