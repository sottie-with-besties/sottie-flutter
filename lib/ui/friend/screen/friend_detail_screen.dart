import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
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
                  FriendReview(
                    nickname: "SkyWalker",
                    mannerPoint: 85,
                    reviewText: "정말 친절하시고 대화가 잘 통합니다. 다음에도 꼭 함께 하고 싶습니다.",
                  ),
                  FriendReview(
                    nickname: "PixelNinja",
                    mannerPoint: 65,
                    reviewText: "대체로 괜찮았지만, 약간의 무례함이 느껴졌습니다. 그래도 좋은 시간이었습니다.",
                  ),
                  FriendReview(
                    nickname: "ShadowHunter",
                    mannerPoint: 100,
                    reviewText: "완벽한 매너와 친절함! 같이 있는 시간이 너무 즐거웠습니다.",
                  ),
                  FriendReview(
                    nickname: "CyberCat",
                    mannerPoint: 55,
                    reviewText: "대화는 잘 통했지만, 가끔 예의가 부족하다고 느꼈습니다.",
                  ),
                  FriendReview(
                    nickname: "DragonSlayer",
                    mannerPoint: 90,
                    reviewText: "대화가 아주 유쾌하고 매너가 좋으신 분이었습니다. 추천합니다!",
                  ),
                  FriendReview(
                    nickname: "MysticMage",
                    mannerPoint: 45,
                    reviewText: "기대에 미치지 못했습니다. 다음 번엔 조금 더 신중히 선택할 것 같습니다.",
                  ),
                  FriendReview(
                    nickname: "LunarEclipse",
                    mannerPoint: 75,
                    reviewText: "괜찮은 시간이었지만, 약간의 아쉬움이 남습니다.",
                  ),
                  FriendReview(
                    nickname: "SilentStorm",
                    mannerPoint: 50,
                    reviewText: "처음엔 좋았지만, 점점 불편한 기분이 들었습니다.",
                  ),
                  FriendReview(
                    nickname: "PixelPirate",
                    mannerPoint: 80,
                    reviewText: "친절하고 매너가 좋은 분입니다. 다음에 또 함께 하고 싶습니다.",
                  ),
                  FriendReview(
                    nickname: "NeonTiger",
                    mannerPoint: 70,
                    reviewText: "대체로 좋았지만, 가끔 대화가 어색할 때가 있었습니다.",
                  ),
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
