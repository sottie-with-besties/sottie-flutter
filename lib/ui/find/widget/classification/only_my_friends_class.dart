import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class OnlyMyFriendsClass extends StatefulWidget {
  const OnlyMyFriendsClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<OnlyMyFriendsClass> createState() => _OnlyMyFriendsClassState();
}

class _OnlyMyFriendsClassState extends State<OnlyMyFriendsClass> {
  bool onlyMyFriends = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "내 친구만 입장",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Switch(
              activeColor: mainBrownColor,
              value: onlyMyFriends,
              onChanged: (val) {
                onlyMyFriends = val;
                widget.classification.onlyMyFriends = onlyMyFriends;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text("입장 조건에 부합하는 내 친구만 채팅방에 입장할 수 있습니다."),
      ],
    );
  }
}
