import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/data_source/post_detail_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_detail_model.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.postModel,
    required this.isWaiting,
  });

  final PostModel postModel;
  final bool isWaiting;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(postModel.date);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Hero(
              tag: postModel.id,
              child: Text(
                postModel.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * hu,
                  color: mainBlackColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFutureBuilder(
              futureFunction: getPostDetailDummy,
              loadingWidget: const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
              callBack: (futureData) {
                final postDetailModelData = futureData as PostDetailModel;

                return Column(
                  children: [
                    Text(
                      postDetailModelData.content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 250 * hu,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SottieCategoryUi(sottieCategory: postModel.category),
                          CurrentNumOfMember(
                            currentMemberCount: postModel.currentMemberCount,
                            maxMemberCount: postModel.maxMemberCount,
                            currentManCount: postModel.currentManCount,
                            maxManCount: postModel.maxManCount,
                            currentWomanCount: postModel.currentWomanCount,
                            maxWomanCount: postModel.maxWomanCount,
                          ),
                          Text(
                              "날짜: ${date.year}년 ${date.month}월 ${date.day}일 ${intToWeekday(date.weekday)} ${renderCustomStringTime(postModel.date, postModel.date)}"),
                          Text("장소: ${postModel.location}"),
                          _renderAgeRange(postDetailModelData.ageRange),
                          Text("매너 온도: ${postDetailModelData.mannerPoint}도 이상"),
                          if (postDetailModelData.startSameTime)
                            const Text(
                                "동시 채팅 시작: 정해진 인원 수만큼 모집될때까지 채팅방이 생성되지 않다가, 정해진 인원 수 만큼 모이면 채팅방이 생성되고 채팅이 시작됩니다."),
                          if (postDetailModelData.openParticipation)
                            const Text(
                                "오픈 채팅: 정해진 모임 날짜로부터 24시간 이후에도 채팅방이 삭제되지 않으며, 채팅방 출입이 자유롭습니다."),
                          if (postDetailModelData.onlyMyFriends)
                            const Text(
                                "오직 내 친구만: 방장의 친구 목록에 등록된 유저만 입장할 수 있습니다."),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isWaiting ? mainRedColor : mainBlueColor,
                      minimumSize: const Size(100, 65),
                    ),
                    onPressed: () {
                      isWaiting ? log("참여 취소") : log("참여하기");
                    },
                    child: Text(
                      isWaiting ? '참여 취소' : '참여하기',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainWhiteSilverColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Text _renderAgeRange(List<String> ageRange) {
  String ageRangeString = '나이:';

  if (ageRange.isEmpty) {
    ageRangeString = '나이 제한 없음 ';
  }

  if (ageRange.contains('10대')) {
    ageRangeString = '$ageRangeString 10대,';
  }

  if (ageRange.contains('20대')) {
    ageRangeString = '$ageRangeString 20대,';
  }

  if (ageRange.contains('30대')) {
    ageRangeString = '$ageRangeString 30대,';
  }

  if (ageRange.contains('40대')) {
    ageRangeString = '$ageRangeString 40대,';
  }

  if (ageRange.contains('50대')) {
    ageRangeString = '$ageRangeString 50대,';
  }

  if (ageRange.contains('60대')) {
    ageRangeString = '$ageRangeString 60대,';
  }

  if (ageRange.contains('70대')) {
    ageRangeString = '$ageRangeString 70대,';
  }

  if (ageRange.contains('80대 이상')) {
    ageRangeString = '$ageRangeString 80대 이상,';
  }

  return Text(ageRangeString.substring(0, ageRangeString.length - 1));
}
