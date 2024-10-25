import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class SottieCategoryUi extends StatelessWidget {
  const SottieCategoryUi({
    super.key,
    required this.sottieCategory,
  });

  final String sottieCategory;

  @override
  Widget build(BuildContext context) {
    return _categoryClassify(sottieCategory);
  }
}

Widget _categoryClassify(String category) {
  Widget sottieCategory = Container();

  if (category == '번개') {
    sottieCategory = _renderCategory(Icons.bolt, '번개');
  }

  if (category == '친목') {
    sottieCategory = _renderCategory(FontAwesomeIcons.userGroup, '친목');
  }

  if (category == '공부') {
    sottieCategory = _renderCategory(FontAwesomeIcons.pencil, '공부');
  }

  if (category == '구인/구직') {
    sottieCategory = _renderCategory(Icons.note_alt, '구인/구직');
  }

  if (category == '게임') {
    sottieCategory = _renderCategory(Icons.gamepad, '게임');
  }

  if (category == '운동') {
    sottieCategory = _renderCategory(FontAwesomeIcons.dumbbell, '운동');
  }

  if (category == '기타') {
    sottieCategory = _renderCategory(Icons.more_horiz, '기타');
  }

  return sottieCategory;
}

Widget _renderCategory(IconData icon, String category) {
  return Row(
    children: [
      FaIcon(
        icon,
        size: 10 * hu,
      ),
      const SizedBox(width: 5),
      Text(category),
    ],
  );
}
