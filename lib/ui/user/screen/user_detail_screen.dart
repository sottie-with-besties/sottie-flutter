import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/user/screen/user_review_screen.dart';
import 'package:sottie_flutter/ui/user/widget/user_radar_chart.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    required this.userId,
    required this.nickName,
    required this.stateMsg,
    required this.isMyFriend,
  });

  final String userId;
  final String nickName;
  final String stateMsg;
  final bool isMyFriend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mainBlueColor.withOpacity(0.05)),
      backgroundColor: mainBlueColor.withOpacity(0.8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: userId,
                  child: UserProfile(
                    profileUrl: userId,
                    randomAvatarSize: 50,
                  ),
                ),
                SizedBox(width: 10 * wu),
                SizedBox(
                  width: 200 * wu,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            nickName,
                            style: TextStyle(
                              color: mainWhiteSilverColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * hu,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        stateMsg,
                        style: TextStyle(
                          color: mainWhiteSilverColor,
                          fontSize: 12 * hu,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10 * hu),
            SizedBox(
              height: 50 * hu,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isMyFriend
                      ? _utilButton(
                          FontAwesomeIcons.message,
                          'DM',
                          () {
                            log("친구 DM 보내기");
                          },
                        )
                      : _utilButton(
                          FontAwesomeIcons.userPlus,
                          '추가',
                          () {
                            log("친구 추가 하기");
                          },
                        ),
                  _utilButton(
                    FontAwesomeIcons.ban,
                    '차단',
                    () {
                      log("친구 차단");
                    },
                  ),
                  _utilButton(
                    FontAwesomeIcons.circleExclamation,
                    '신고',
                    () {
                      log("친구 신고");
                    },
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                UserRadarChart(),
                UserReviewScreen(),
              ],
            ),
            SizedBox(height: 5 * hu),
            OutlinedButton(
              onPressed: () {
                log("리뷰 작성하기");
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: mainWhiteSilverColor)),
              child: const Text(
                "리뷰 작성하기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mainWhiteSilverColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _utilButton(IconData icon, String desc, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: mainWhiteSilverColor,
          size: 16 * hu,
        ),
        SizedBox(height: 2 * hu),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: mainWhiteSilverColor,
            fontSize: 10 * hu,
          ),
        )
      ],
    ),
  );
}
