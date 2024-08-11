import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class OnlyMyFriendsClass extends StatefulWidget {
  const OnlyMyFriendsClass({super.key});

  @override
  State<OnlyMyFriendsClass> createState() => _OnlyMyFriendsClassState();
}

class _OnlyMyFriendsClassState extends State<OnlyMyFriendsClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: "내 친구만 입장"),
            Switch(
              activeColor: mainBrownColor,
              value: postSettingEntity.onlyMyFriends,
              onChanged: (val) {
                postSettingEntity.onlyMyFriends = val;
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
