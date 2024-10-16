import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_top.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.model,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(model.date);

    return GestureDetector(
      onTap: () => context.push(
        CustomRouter.postDetailPath,
        extra: {
          'postModel': model,
        },
      ),
      child: Padding(
        padding: EdgeInsets.all(8 * hu),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: mainBlueColor,
              width: 0.7,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10 * wu, vertical: 8 * hu),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatRoomTop(
                categories: model.category,
                currentMemberCount: model.currentMemberCount,
                maxMemberCount: model.maxMemberCount,
                currentManCount: model.currentManCount,
                maxManCount: model.maxManCount,
                currentWomanCount: model.currentWomanCount,
                maxWomanCount: model.maxWomanCount,
              ),
              SizedBox(height: 12 * hu),
              Text(
                model.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12 * hu,
                ),
              ),
              SizedBox(height: 5 * hu),
              Text(
                "${date.year}년 ${date.month}월 ${date.day}일 ${intToWeekday(date.weekday)} ${renderCustomStringTime(model.date, model.date)}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5 * hu),
              Text(
                model.location,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
