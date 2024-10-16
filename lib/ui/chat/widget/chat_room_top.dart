import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ChatRoomTop extends StatelessWidget {
  const ChatRoomTop({
    super.key,
    required this.categories,
    required this.currentMemberCount,
    required this.maxMemberCount,
    required this.currentManCount,
    required this.maxManCount,
    required this.currentWomanCount,
    required this.maxWomanCount,
  });

  final List<String> categories;
  final int? currentMemberCount;
  final int? maxMemberCount;
  final int? currentManCount;
  final int? maxManCount;
  final int? currentWomanCount;
  final int? maxWomanCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 200 * wu,
          ),
          child: FittedBox(
            child: _categoryClassify(categories),
          ),
        ),
        _renderMemberCount(
          currentMemberCount: currentMemberCount,
          maxMemberCount: maxMemberCount,
          currentManCount: currentManCount,
          maxManCount: maxManCount,
          currentWomanCount: currentWomanCount,
          maxWomanCount: maxWomanCount,
        ),
      ],
    );
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
    children: [
      ...categories,
    ],
  );
}

Widget _renderCategory(IconData icon, String category) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Row(
      children: [
        FaIcon(
          icon,
          size: 14 * hu,
        ),
        const SizedBox(width: 5),
        Text(category),
      ],
    ),
  );
}

Widget _renderMemberCount({
  int? currentMemberCount,
  int? maxMemberCount,
  int? currentManCount,
  int? maxManCount,
  int? currentWomanCount,
  int? maxWomanCount,
}) {
  if (maxMemberCount == null && maxManCount == null && maxWomanCount == null) {
    return const Text("인원 제한 없음");
  } else if (currentMemberCount != null &&
      currentManCount == null &&
      currentWomanCount == null) {
    return Text("$currentMemberCount/$maxMemberCount");
  } else if (currentManCount != null && currentWomanCount != null) {
    return Row(
      children: [
        const Icon(
          Icons.man,
          color: Colors.blue,
        ),
        SizedBox(width: 1 * wu),
        Text("$currentManCount/$maxManCount"),
        SizedBox(width: 3 * wu),
        const Icon(
          Icons.woman,
          color: Colors.pinkAccent,
        ),
        SizedBox(width: 1 * wu),
        Text("$currentWomanCount/$maxWomanCount"),
      ],
    );
  } else {
    return Container();
  }
}
