import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const infoStyle = TextStyle(color: mainSilverColor);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RandomAvatar(
                  DateTime.now().toIso8601String(),
                  width: 45 * wu,
                  height: 45 * wu,
                ),
                SizedBox(
                  width: 10 * wu,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "닉네임",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * hu,
                      ),
                    ),
                    const Text(
                      "kjp00552277@gmail.com",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            OutlinedButton(
                onPressed: () {
                  log("수정");
                },
                child: const Text(
                  "수정",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
        SizedBox(
          height: 10 * hu,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: const Color(0xdda0522d),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 30 * hu,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2000년 5월 27일",
                style: infoStyle,
              ),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
              ),
              Text(
                "남성",
                style: infoStyle,
              ),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
              ),
              Text(
                "김진표",
                style: infoStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
