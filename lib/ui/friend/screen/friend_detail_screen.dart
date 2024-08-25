import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
import 'package:sottie_flutter/data/friend/model/friend_review_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_radar_chart.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_review.dart';

class FriendDetailScreen extends StatefulWidget {
  const FriendDetailScreen({
    super.key,
    required this.model,
  });

  final FriendDetailModel model;

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen> {
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
                Hero(
                  tag: widget.model.id,
                  child: UserProfile(
                    avatarId: widget.model.id,
                    randomAvatarSize: 50,
                  ),
                ),
                SizedBox(
                  width: 225 * wu,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.model.nickname,
                            style: TextStyle(
                              color: mainSilverColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * hu,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.model.stateMsg,
                        style: TextStyle(
                          color: mainSilverColor,
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
                  _utilButton(
                    FontAwesomeIcons.message,
                    'DM',
                    () {
                      log("친구 DM 보내기");
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
            SizedBox(
              height: 350 * hu,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  FriendRadarChart(
                    participationValue: widget.model.participationValue,
                    attitudeValue: widget.model.attitudeValue,
                    timeValue: widget.model.timeValue,
                    likeabilityValue: widget.model.likeabilityValue,
                    trustworthinessValue: widget.model.trustworthinessValue,
                  ),
                  SizedBox(height: 10 * hu),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hu, right: 24 * wu),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "매너 온도",
                          style: TextStyle(
                            fontSize: 12 * hu,
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: mainSilverColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "${widget.model.participationValue + widget.model.attitudeValue + widget.model.timeValue + widget.model.likeabilityValue + widget.model.trustworthinessValue}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainSilverColor,
                              fontSize: 16 * hu,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "°C",
                          style: TextStyle(
                            fontSize: 12 * hu,
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ..._dummyData.map((data) {
                    return FriendReview(model: data);
                  }),
                ],
              ),
            ),
            SizedBox(height: 5 * hu),
            OutlinedButton(
              onPressed: () {
                log("리뷰 작성하기");
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: mainSilverColor)),
              child: const Text(
                "리뷰 작성하기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mainSilverColor,
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
          color: mainSilverColor,
          size: 16 * hu,
        ),
        SizedBox(height: 2 * hu),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: mainSilverColor,
            fontSize: 10 * hu,
          ),
        )
      ],
    ),
  );
}

final List<FriendReviewModel> _dummyData = [
  FriendReviewModel(
    id: '1',
    nickname: 'Alice',
    total: 75,
    participationIndex: 3,
    attitudeIndex: 4,
    timeIndex: 2,
    likeabilityIndex: 4,
    trustworthinessIndex: 3,
  ),
  FriendReviewModel(
    id: '2',
    nickname: 'Bob',
    total: 50,
    participationIndex: 2,
    attitudeIndex: 3,
    timeIndex: 3,
    likeabilityIndex: 2,
    trustworthinessIndex: 2,
  ),
  FriendReviewModel(
    id: '3',
    nickname: 'Charlie',
    total: 85,
    participationIndex: 4,
    attitudeIndex: 4,
    timeIndex: 4,
    likeabilityIndex: 3,
    trustworthinessIndex: 4,
  ),
  FriendReviewModel(
    id: '4',
    nickname: 'David',
    total: 40,
    participationIndex: 1,
    attitudeIndex: 2,
    timeIndex: 1,
    likeabilityIndex: 3,
    trustworthinessIndex: 2,
  ),
  FriendReviewModel(
    id: '5',
    nickname: 'Eva',
    total: 95,
    participationIndex: 4,
    attitudeIndex: 4,
    timeIndex: 4,
    likeabilityIndex: 4,
    trustworthinessIndex: 4,
  ),
  FriendReviewModel(
    id: '6',
    nickname: 'Frank',
    total: 30,
    participationIndex: 1,
    attitudeIndex: 1,
    timeIndex: 1,
    likeabilityIndex: 2,
    trustworthinessIndex: 1,
  ),
  FriendReviewModel(
    id: '7',
    nickname: 'Grace',
    total: 65,
    participationIndex: 3,
    attitudeIndex: 3,
    timeIndex: 2,
    likeabilityIndex: 3,
    trustworthinessIndex: 3,
  ),
  FriendReviewModel(
    id: '8',
    nickname: 'Hank',
    total: 55,
    participationIndex: 2,
    attitudeIndex: 3,
    timeIndex: 3,
    likeabilityIndex: 2,
    trustworthinessIndex: 3,
  ),
  FriendReviewModel(
    id: '9',
    nickname: 'Ivy',
    total: 90,
    participationIndex: 4,
    attitudeIndex: 4,
    timeIndex: 4,
    likeabilityIndex: 3,
    trustworthinessIndex: 4,
  ),
  FriendReviewModel(
    id: '10',
    nickname: 'Jack',
    total: 70,
    participationIndex: 3,
    attitudeIndex: 3,
    timeIndex: 3,
    likeabilityIndex: 3,
    trustworthinessIndex: 3,
  ),
];
