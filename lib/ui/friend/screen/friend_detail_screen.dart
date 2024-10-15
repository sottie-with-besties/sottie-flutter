import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/friend/data_source/friend_detail_dummy.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_radar_chart.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_review.dart';

class FriendDetailScreen extends StatelessWidget {
  const FriendDetailScreen({
    super.key,
    required this.model,
    required this.isMyFriend,
  });

  final FriendModel model;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: model.id,
                  child: UserProfile(
                    profileUrl: model.id,
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
                            model.nickname,
                            style: TextStyle(
                              color: mainWhiteSilverColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * hu,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (model.stateMsg != null)
                        Text(
                          model.stateMsg!,
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
            SizedBox(
              height: 350 * hu,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  CustomFutureBuilder(
                    futureFunction: getFriendDetailDummy,
                    callBack: (futureData) {
                      final detailData = futureData as FriendDetailModel;

                      return Column(
                        children: [
                          detailData.participationValue != null
                              ? FriendRadarChart(
                                  participationValue:
                                      detailData.participationValue!,
                                  attitudeValue: detailData.attitudeValue!,
                                  timeValue: detailData.timeValue!,
                                  likeabilityValue:
                                      detailData.likeabilityValue!,
                                  trustworthinessValue:
                                      detailData.trustworthinessValue!,
                                )
                              : const Center(
                                  child: Text(
                                    "친구를 리뷰하세요!",
                                    style: TextStyle(
                                      color: mainWhiteSilverColor,
                                    ),
                                  ),
                                ),
                          SizedBox(height: 10 * hu),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10 * hu, right: 24 * wu),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "매너 온도",
                                  style: TextStyle(
                                    fontSize: 12 * hu,
                                    color: mainWhiteSilverColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: mainWhiteSilverColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(8),
                                  child: detailData.participationValue != null
                                      ? Text(
                                          (detailData.participationValue! +
                                                  detailData.attitudeValue! +
                                                  detailData.timeValue! +
                                                  detailData.likeabilityValue! +
                                                  detailData
                                                      .trustworthinessValue!)
                                              .toStringAsFixed(1),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: mainWhiteSilverColor,
                                            fontSize: 16 * hu,
                                          ),
                                        )
                                      : Container(),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "°C",
                                  style: TextStyle(
                                    fontSize: 12 * hu,
                                    color: mainWhiteSilverColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (detailData.friendReviews != null)
                            if (detailData.friendReviews!.isNotEmpty)
                              ...detailData.friendReviews!.map<Widget>((data) {
                                return FriendReview(model: data);
                              }),
                        ],
                      );
                    },
                    notHasData: const Center(
                      child: Text(
                        "데이터가 존재하지 않습니다.",
                        style: TextStyle(
                          color: mainWhiteSilverColor,
                        ),
                      ),
                    ),
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
