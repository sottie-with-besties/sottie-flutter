import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_dm_box.dart';

class FriendDmScreen extends StatefulWidget {
  const FriendDmScreen({super.key});

  @override
  State<FriendDmScreen> createState() => _FriendDmScreenState();
}

class _FriendDmScreenState extends State<FriendDmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0x00a0522d)),
      backgroundColor: lightBrownColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UserProfile(
                  avatarId: "abcde",
                  randomAvatarSize: 50,
                ),
                SizedBox(
                  width: 225 * wu,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "김진표",
                        style: TextStyle(
                          color: mainSilverColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16 * wu,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "안녕하세요 수원 사는 2000년생 김진표 입니다.",
                        style: TextStyle(
                          color: mainSilverColor,
                          fontSize: 12 * wu,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const FriendDmBox(),
            renderDmTextField(),
          ],
        ),
      ),
    );
  }
}

Widget renderDmTextField() {
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
