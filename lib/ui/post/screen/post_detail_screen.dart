import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_entity.dart';
import 'package:sottie_flutter/provider/post/post_provider.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_snackbar.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.postEntity,
    required this.isWaiting,
    required this.isCheckInfo,
  });

  final PostEntity postEntity;
  final bool isWaiting;
  final bool isCheckInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              mainGreenColor,
              mainBlueColor.withValues(alpha: 0.5),
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
                      postEntity.title,
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
                      postCategory: postEntity.postCategory,
                      color: mainWhiteSilverColor,
                    ),
                    SizedBox(height: 5 * hu),
                    CurrentNumOfMember(
                      currentPeopleNum: postEntity.numOfCurrentPeople,
                      peopleNum: postEntity.numOfPeople,
                      currentMaleNum: postEntity.numOfCurrentMale,
                      maleNum: postEntity.numOfMale,
                      currentFemaleNum: postEntity.numOfCurrentFemale,
                      femaleNum: postEntity.numOfFemale,
                      genderRestriction: postEntity.genderRestriction,
                    ),
                    SizedBox(height: 10 * hu),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postEntity.contents,
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
                              convertDateTimeIntoString(postEntity.postDate),
                              style: _conditionTextStyle,
                            ),
                            Text(
                              postEntity.postLocation.koreanName,
                              style: _conditionTextStyle,
                            ),
                            postEntity.ageRestriction
                                ? Text(
                                    convertAgeRangeToString(
                                        postEntity.ageFrom, postEntity.ageTo),
                                    style: _conditionTextStyle,
                                  )
                                : Text(
                                    "나이 제한 없음",
                                    style: _conditionTextStyle,
                                  ),
                            if (postEntity.mannerRestriction)
                              Text(
                                "36.5°C 이상",
                                style: _conditionTextStyle,
                              ),
                            if (postEntity.onlyMyFriends)
                              Text(
                                "내 친구만",
                                style: _conditionTextStyle,
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    if (!isCheckInfo)
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
                              onPressed: () async {
                                if (isWaiting) {
                                  log("참여취소");

                                  final result = await postProvider.postExit();

                                  if (context.mounted) {
                                    if (result) {
                                    } else {
                                      showCustomSnackBar(
                                          context, '에러가 발생하였습니다.');
                                    }
                                  }
                                } else {
                                  log("참여하기");

                                  final result = await postProvider.postJoin(
                                    postId: postEntity.id,
                                  );

                                  if (context.mounted) {
                                    if (result) {
                                    } else {
                                      showCustomSnackBar(
                                          context, '참여하기 도중 에러가 발생하였습니다.');
                                    }
                                  }
                                }
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
