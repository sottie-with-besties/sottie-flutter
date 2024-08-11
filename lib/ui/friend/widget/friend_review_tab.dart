import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_review.dart';

class FriendReviewTab extends StatefulWidget {
  const FriendReviewTab({super.key});

  @override
  State<FriendReviewTab> createState() => _FriendReviewTabState();
}

class _FriendReviewTabState extends State<FriendReviewTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 350 * hu,
            child: ListView(
              children: [
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
          SizedBox(height: 20 * hu),
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
              ))
        ],
      ),
    );
  }
}
