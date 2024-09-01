import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/friend/data_source/friend_detail_dummy.dart';
import 'package:sottie_flutter/data/friend/data_source/friend_review_dummy.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/data/friend/model/friend_review_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_radar_chart.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_review.dart';

class FriendDetailScreen extends StatefulWidget {
  const FriendDetailScreen({
    super.key,
    required this.model,
    required this.isMyFriend,
  });

  final FriendModel model;
  final bool isMyFriend;

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen> {
  late Future<FriendDetailModel> friendDetailModel;
  late Future<List<FriendReviewModel>> friendReviewModelList;

  @override
  void initState() {
    super.initState();

    friendDetailModel = getFriendDetailDummy();
    friendReviewModelList = getFriendReviewDummy();
  }

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
                  widget.isMyFriend
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
                  FutureBuilder(
                    future: friendDetailModel,
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: mainSilverColor)),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: Text("친구를 리뷰하세요!"),
                        );
                      } else if (snapshot.hasData) {
                        final data = snapshot.data;

                        return Column(
                          children: [
                            FriendRadarChart(
                              participationValue: data!.participationValue,
                              attitudeValue: data.attitudeValue,
                              timeValue: data.timeValue,
                              likeabilityValue: data.likeabilityValue,
                              trustworthinessValue: data.trustworthinessValue,
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
                                      (data.participationValue +
                                              data.attitudeValue +
                                              data.timeValue +
                                              data.likeabilityValue +
                                              data.trustworthinessValue)
                                          .toStringAsFixed(1),
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
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("에러가 발생했습니다!",
                              style: TextStyle(color: mainSilverColor)),
                        );
                      }
                    },
                  ),
                  FutureBuilder(
                    future: friendReviewModelList,
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingSkeleton();
                      } else if (!snapshot.hasData) {
                        return Container();
                      } else if (snapshot.hasData) {
                        final data = snapshot.data;

                        return Column(
                          children: data!.map((data) {
                            return FriendReview(model: data);
                          }).toList(),
                        );
                      } else {
                        return const Center(
                          child: Text("에러가 발생했습니다!",
                              style: TextStyle(color: mainSilverColor)),
                        );
                      }
                    },
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
