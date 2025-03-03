import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class InChatNotification extends StatelessWidget {
  const InChatNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "김진표",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10 * hu),
          ),
          const SizedBox(height: 5),
          Text("공지사항 내용입니다.", style: TextStyle(fontSize: 10 * hu)),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "12월 4일 수요일 오전 8시 30분",
              style: TextStyle(color: mainGreyColor, fontSize: 9 * hu),
            ),
          ),
        ],
      ),
    );
  }
}
