import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.model, required this.isWaiting});

  final PostModel model;
  final bool isWaiting;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.push(
            CustomRouter.postDetailPath,
            extra: {'postModel': model, 'isWaiting': isWaiting},
          ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.greyColor, width: 0.5),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16 * ScreenSize.wu,
          vertical: 8 * ScreenSize.hu,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SottieCategoryUi(postCategory: model.postCategory),
            SizedBox(height: 5 * ScreenSize.hu),
            Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12 * ScreenSize.hu,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 3 * ScreenSize.hu),
            Text(
              convertDateTimeIntoString(model.postDate),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10 * ScreenSize.hu,
                fontWeight: FontWeight.bold,
                color: AppColors.greyColor2,
              ),
            ),
            SizedBox(height: 1 * ScreenSize.hu),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.postLocation.koreanName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10 * ScreenSize.hu,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor2,
                  ),
                ),
                CurrentNumOfMember(
                  currentPeopleNum: model.numOfCurrentPeople,
                  peopleNum: model.numOfPeople,
                  currentMaleNum: model.numOfCurrentMale,
                  maleNum: model.numOfMale,
                  currentFemaleNum: model.numOfCurrentFemale,
                  femaleNum: model.numOfFemale,
                  genderRestriction: model.genderRestriction,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
