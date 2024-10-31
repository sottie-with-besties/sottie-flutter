import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class CurrentNumOfMember extends StatelessWidget {
  const CurrentNumOfMember({
    super.key,
    required this.currentMemberCount,
    required this.maxMemberCount,
    required this.currentManCount,
    required this.maxManCount,
    required this.currentWomanCount,
    required this.maxWomanCount,
    this.color = mainBlackColor,
  });

  final int? currentMemberCount;
  final int? maxMemberCount;
  final int? currentManCount;
  final int? maxManCount;
  final int? currentWomanCount;
  final int? maxWomanCount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _renderMemberCount(
      currentMemberCount: currentMemberCount,
      maxMemberCount: maxMemberCount,
      currentManCount: currentManCount,
      maxManCount: maxManCount,
      currentWomanCount: currentWomanCount,
      maxWomanCount: maxWomanCount,
      color: color,
    );
  }
}

Widget _renderMemberCount({
  int? currentMemberCount,
  int? maxMemberCount,
  int? currentManCount,
  int? maxManCount,
  int? currentWomanCount,
  int? maxWomanCount,
  Color color = mainBlackColor,
}) {
  if (maxMemberCount == null && maxManCount == null && maxWomanCount == null) {
    return const Text("인원 제한 없음");
  } else if (currentMemberCount != null &&
      currentManCount == null &&
      currentWomanCount == null) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: color,
          size: 12 * hu,
        ),
        SizedBox(width: 1 * wu),
        Text(
          "$currentMemberCount/$maxMemberCount",
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  } else if (currentManCount != null && currentWomanCount != null) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.blue,
          size: 12 * hu,
        ),
        SizedBox(width: 1 * wu),
        Text(
          "$currentManCount/$maxManCount",
          style: TextStyle(
            color: color,
          ),
        ),
        SizedBox(width: 3 * wu),
        Icon(
          Icons.person,
          color: Colors.pinkAccent,
          size: 12 * hu,
        ),
        SizedBox(width: 1 * wu),
        Text(
          "$currentWomanCount/$maxWomanCount",
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  } else {
    return Container();
  }
}
