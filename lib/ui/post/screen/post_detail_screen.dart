import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/data_source/post_detail_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_detail_model.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              mainGreenColor,
              mainBlueColor.withOpacity(0.5),
              mainBlueColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: mainBlackColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postModel.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * hu,
                        color: mainBlackColor,
                      ),
                    ),
                    SizedBox(height: 10 * hu),
                    SottieCategoryUi(
                      sottieCategory: postModel.category,
                    ),
                    SizedBox(height: 5 * hu),
                    CurrentNumOfMember(
                      currentMemberCount: postModel.currentMemberCount,
                      maxMemberCount: postModel.maxMemberCount,
                      currentManCount: postModel.currentManCount,
                      maxManCount: postModel.maxManCount,
                      currentWomanCount: postModel.currentWomanCount,
                      maxWomanCount: postModel.maxWomanCount,
                    ),
                    SizedBox(height: 10 * hu),
                    CustomFutureBuilder(
                      futureFunction: getPostDetailDummy,
                      loadingWidget: const LoadingSkeleton(itemCount: 1),
                      callBack: (futureData) {
                        final postDetailModelData =
                            futureData as PostDetailModel;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postDetailModelData.content,
                              style: TextStyle(
                                fontSize: 11 * hu,
                                color: mainBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20 * hu),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${date.month}월 ${date.day}일 ${intToWeekday(date.weekday)} ${renderCustomStringTime(postModel.date, postModel.date)}",
                                  style: _conditionTextStyle,
                                ),
                                Text(
                                  postModel.location,
                                  style: _conditionTextStyle,
                                ),
                                Text(
                                  _renderAgeRange(postDetailModelData.ageRange),
                                  style: _conditionTextStyle,
                                ),
                                Text(
                                  "${postDetailModelData.mannerPoint}도 이상",
                                  style: _conditionTextStyle,
                                ),
                                if (postDetailModelData.startSameTime)
                                  Text(
                                    "동시 채팅 시작",
                                    style: _conditionTextStyle,
                                  ),
                                if (postDetailModelData.onlyMyFriends)
                                  Text(
                                    "내 친구만",
                                    style: _conditionTextStyle,
                                  ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: mainBlackColor,
                              ),
                              minimumSize: const Size(100, 65),
                            ),
                            onPressed: () {
                              isWaiting ? log("참여 취소") : log("참여하기");
                            },
                            child: Text(
                              isWaiting ? '참여 취소' : '참여하기',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: mainBlackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _renderAgeRange(List<String> ageRange) {
  String ageRangeString = '';

  if (ageRange.isEmpty) {
    ageRangeString = '나이 제한 없음';
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

  return ageRangeString.substring(1, ageRangeString.length - 1);
}

final _conditionTextStyle = TextStyle(
  color: mainBlackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11 * hu,
);
