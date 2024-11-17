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
    final date = DateTime.parse(postModel.date).toLocal();

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
            stops: const [0.01, 0.2, 1],
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
                        color: mainWhiteSilverColor,
                      ),
                    ),
                    SizedBox(height: 10 * hu),
                    SottieCategoryUi(
                      sottieCategory: postModel.category,
                      color: mainWhiteSilverColor,
                    ),
                    SizedBox(height: 5 * hu),
                    CurrentNumOfMember(
                      currentMemberCount: postModel.currentMemberCount,
                      maxMemberCount: postModel.maxMemberCount,
                      currentManCount: postModel.currentManCount,
                      maxManCount: postModel.maxManCount,
                      currentWomanCount: postModel.currentWomanCount,
                      maxWomanCount: postModel.maxWomanCount,
                      color: mainWhiteSilverColor,
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
                                color: mainWhiteSilverColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20 * hu),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  convertDateTimeIntoString(date),
                                  style: _conditionTextStyle,
                                ),
                                Text(
                                  postModel.location,
                                  style: _conditionTextStyle,
                                ),
                                Text(
                                  convertAgeRangeToString(
                                      postDetailModelData.ageRange),
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
                                color: mainWhiteSilverColor,
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
                                color: mainWhiteSilverColor,
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

final _conditionTextStyle = TextStyle(
  color: mainWhiteSilverColor,
  fontWeight: FontWeight.bold,
  fontSize: 11 * hu,
);
