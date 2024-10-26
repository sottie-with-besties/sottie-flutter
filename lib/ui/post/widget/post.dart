import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.model,
    required this.isWaiting,
  });

  final PostModel model;
  final bool isWaiting;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(model.date);

    return GestureDetector(
      onTap: () => context.push(
        CustomRouter.postDetailPath,
        extra: {
          'postModel': model,
          'isWaiting': isWaiting,
        },
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: mainGreyColor,
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16 * wu, vertical: 8 * hu),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SottieCategoryUi(sottieCategory: model.category),
            SizedBox(height: 5 * hu),
            Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12 * hu,
                fontWeight: FontWeight.bold,
                color: mainBlackColor,
              ),
            ),
            SizedBox(height: 3 * hu),
            Text(
              "${date.month}월 ${date.day}일 ${intToWeekday(date.weekday)} ${renderCustomStringTime(model.date, model.date)}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10 * hu,
                fontWeight: FontWeight.bold,
                color: mainGreyColor2,
              ),
            ),
            SizedBox(height: 1 * hu),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.location,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10 * hu,
                    fontWeight: FontWeight.bold,
                    color: mainGreyColor2,
                  ),
                ),
                CurrentNumOfMember(
                  currentMemberCount: model.currentMemberCount,
                  maxMemberCount: model.maxMemberCount,
                  currentManCount: model.currentManCount,
                  maxManCount: model.maxManCount,
                  currentWomanCount: model.currentWomanCount,
                  maxWomanCount: model.maxWomanCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
