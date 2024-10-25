import 'package:flutter/material.dart';
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
  });

  final int? currentMemberCount;
  final int? maxMemberCount;
  final int? currentManCount;
  final int? maxManCount;
  final int? currentWomanCount;
  final int? maxWomanCount;

  @override
  Widget build(BuildContext context) {
    return _renderMemberCount(
      currentMemberCount: currentMemberCount,
      maxMemberCount: maxMemberCount,
      currentManCount: currentManCount,
      maxManCount: maxManCount,
      currentWomanCount: currentWomanCount,
      maxWomanCount: maxWomanCount,
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
        Icon(
          Icons.man,
          color: Colors.blue,
          size: 12 * hu,
        ),
        SizedBox(width: 1 * wu),
        Text("$currentManCount/$maxManCount"),
        SizedBox(width: 3 * wu),
        Icon(
          Icons.woman,
          color: Colors.pinkAccent,
          size: 12 * hu,
        ),
        SizedBox(width: 1 * wu),
        Text("$currentWomanCount/$maxWomanCount"),
      ],
    );
  } else {
    return Container();
  }
}
