import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class OnlyMyFriendsOption extends StatefulWidget {
  const OnlyMyFriendsOption({super.key});

  @override
  State<OnlyMyFriendsOption> createState() => _OnlyMyFriendsOptionState();
}

class _OnlyMyFriendsOptionState extends State<OnlyMyFriendsOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: "내 친구만 입장"),
            Switch(
              activeColor: mainBlueColor,
              value: postOptionsSetting.onlyMyFriends,
              onChanged: (val) {
                postOptionsSetting.onlyMyFriends = val;
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
