import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class SottieCategoryUi extends StatelessWidget {
  const SottieCategoryUi({
    super.key,
    required this.sottieCategory,
    this.color = mainBlackColor,
  });

  final String sottieCategory;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _categoryClassify(sottieCategory, color);
  }
}

Widget _categoryClassify(String category, Color color) {
  Widget sottieCategory = Container();

  if (category == '번개') {
    sottieCategory = _renderCategory(Icons.bolt, '번개', color);
  }

  if (category == '친목') {
    sottieCategory = _renderCategory(FontAwesomeIcons.userGroup, '친목', color);
  }

  if (category == '공부') {
    sottieCategory = _renderCategory(FontAwesomeIcons.pencil, '공부', color);
  }

  if (category == '구인/구직') {
    sottieCategory = _renderCategory(Icons.note_alt, '구인/구직', color);
  }

  if (category == '게임') {
    sottieCategory = _renderCategory(Icons.gamepad, '게임', color);
  }

  if (category == '운동') {
    sottieCategory = _renderCategory(FontAwesomeIcons.dumbbell, '운동', color);
  }

  if (category == '기타') {
    sottieCategory = _renderCategory(Icons.more_horiz, '기타', color);
  } else {
    sottieCategory = _renderCategory(Icons.more_horiz, '알 수 없음', color);
  }

  return sottieCategory;
}

Widget _renderCategory(
  IconData icon,
  String category,
  Color color,
) {
  return Row(
    children: [
      FaIcon(
        icon,
        size: 10 * hu,
        color: color,
      ),
      const SizedBox(width: 5),
      Text(
        category,
        style: TextStyle(
          color: color,
        ),
      ),
    ],
  );
}
