import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class SottieCategoryUi extends StatelessWidget {
  const SottieCategoryUi({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return _categoryClassify(categories);
  }
}

Row _categoryClassify(List<String> categoryList) {
  List<Widget> categories = [];

  if (categoryList.contains('번개')) {
    categories.add(_renderCategory(Icons.bolt, '번개'));
  }

  if (categoryList.contains('친목')) {
    categories.add(_renderCategory(FontAwesomeIcons.userGroup, '친목'));
  }

  if (categoryList.contains('공부')) {
    categories.add(_renderCategory(FontAwesomeIcons.pencil, '공부'));
  }

  if (categoryList.contains('구인/구직')) {
    categories.add(_renderCategory(Icons.note_alt, '구인/구직'));
  }

  if (categoryList.contains('게임')) {
    categories.add(_renderCategory(Icons.gamepad, '게임'));
  }

  if (categoryList.contains('운동')) {
    categories.add(_renderCategory(FontAwesomeIcons.dumbbell, '운동'));
  }

  if (categoryList.contains('기타')) {
    categories.add(_renderCategory(Icons.more_horiz, '기타'));
  }

  return Row(
    children: categories,
  );
}

Widget _renderCategory(IconData icon, String category) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Row(
      children: [
        FaIcon(
          icon,
          size: 10 * hu,
        ),
        const SizedBox(width: 5),
        Text(category),
      ],
    ),
  );
}
