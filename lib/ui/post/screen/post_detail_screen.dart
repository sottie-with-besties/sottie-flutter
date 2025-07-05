import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';
import 'package:sottie_flutter/use_case/post/post_use_case.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.postModel,
    required this.isWaiting,
    required this.isCheckInfo,
  });

  final PostModel postModel;
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
              AppColors.greenColor,
              AppColors.blueColor.withValues(alpha: 0.5),
              AppColors.blueColor,
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
                        color: AppColors.blackColor,
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
                        fontSize: 16 * ScreenSize.hu,
                        color: AppColors.whiteSilverColor,
                      ),
                    ),
                    SizedBox(height: 10 * ScreenSize.hu),
                    SottieCategoryUi(
                      postCategory: postModel.postCategory,
                      color: AppColors.whiteSilverColor,
                    ),
                    SizedBox(height: 5 * ScreenSize.hu),
                    CurrentNumOfMember(
                      currentPeopleNum: postModel.numOfCurrentPeople,
                      peopleNum: postModel.numOfPeople,
                      currentMaleNum: postModel.numOfCurrentMale,
                      maleNum: postModel.numOfMale,
                      currentFemaleNum: postModel.numOfCurrentFemale,
                      femaleNum: postModel.numOfFemale,
                      genderRestriction: postModel.genderRestriction,
                    ),
                    SizedBox(height: 10 * ScreenSize.hu),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postModel.contents,
                          style: TextStyle(
                            fontSize: 11 * ScreenSize.hu,
                            color: AppColors.whiteSilverColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20 * ScreenSize.hu),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              convertDateTimeIntoString(postModel.postDate),
                              style: _conditionTextStyle,
                            ),
                            Text(
                              postModel.postLocation.koreanName,
                              style: _conditionTextStyle,
                            ),
                            postModel.ageRestriction
                                ? Text(
                                  convertAgeRangeToString(
                                    postModel.ageFrom,
                                    postModel.ageTo,
                                  ),
                                  style: _conditionTextStyle,
                                )
                                : Text("나이 제한 없음", style: _conditionTextStyle),
                            if (postModel.mannerRestriction)
                              Text("36.5°C 이상", style: _conditionTextStyle),
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
                                  color: AppColors.whiteSilverColor,
                                ),
                                minimumSize: const Size(100, 65),
                              ),
                              onPressed: () async {
                                if (isWaiting) {
                                  log("참여취소");

                                  final result = await PostUseCase.postExit(
                                    roomId: postModel.id.toString(),
                                  );

                                  if (context.mounted) {
                                    if (result) {
                                    } else {
                                      ModalController.showCustomSnackBar(
                                        context,
                                        '에러가 발생하였습니다.',
                                      );
                                    }
                                  }
                                } else {
                                  log("참여하기");

                                  final result = await PostUseCase.postJoin(
                                    roomId: postModel.id.toString(),
                                  );

                                  if (context.mounted) {
                                    if (result) {
                                    } else {
                                      ModalController.showCustomSnackBar(
                                        context,
                                        '참여하기 도중 에러가 발생하였습니다.',
                                      );
                                    }
                                  }
                                }
                              },
                              child: Text(
                                isWaiting ? '참여 취소' : '참여하기',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteSilverColor,
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
  color: AppColors.whiteSilverColor,
  fontWeight: FontWeight.bold,
  fontSize: 11 * ScreenSize.hu,
);
