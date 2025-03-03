import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_category.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class SottieCategoryUi extends StatelessWidget {
  const SottieCategoryUi({
    super.key,
    required this.postCategory,
    this.color = mainBlackColor,
  });

  final PostCategory postCategory;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _categoryClassify(postCategory, color);
  }
}

Widget _categoryClassify(PostCategory postCategory, Color color) {
  Widget sottieCategory = Container();

  if (postCategory == PostCategory.THUNDER) {
    sottieCategory = _renderCategory(Icons.bolt, '번개', color);
  }

  if (postCategory == PostCategory.FRIENDSHIP) {
    sottieCategory = _renderCategory(FontAwesomeIcons.userGroup, '친목', color);
  }

  if (postCategory == PostCategory.STUDY) {
    sottieCategory = _renderCategory(FontAwesomeIcons.pencil, '공부', color);
  }

  if (postCategory == PostCategory.HIRING) {
    sottieCategory = _renderCategory(Icons.note_alt, '구인/구직', color);
  }

  if (postCategory == PostCategory.GAME) {
    sottieCategory = _renderCategory(Icons.gamepad, '게임', color);
  }

  if (postCategory == PostCategory.EXERCISE) {
    sottieCategory = _renderCategory(FontAwesomeIcons.dumbbell, '운동', color);
  }

  if (postCategory == PostCategory.OTHERS) {
    sottieCategory = _renderCategory(Icons.more_horiz, '기타', color);
  }

  return sottieCategory;
}

Widget _renderCategory(IconData icon, String category, Color color) {
  return Row(
    children: [
      FaIcon(icon, size: 10 * hu, color: color),
      const SizedBox(width: 5),
      Text(category, style: TextStyle(color: color)),
    ],
  );
}
