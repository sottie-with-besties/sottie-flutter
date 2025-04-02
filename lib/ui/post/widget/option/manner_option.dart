import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class MannerOption extends StatefulWidget {
  const MannerOption({super.key});

  @override
  State<MannerOption> createState() => _MannerOptionState();
}

class _MannerOptionState extends State<MannerOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: "매너 온도 제한"),
            Switch(
              activeColor: mainBlueColor,
              value: postOptions.mannerRestriction,
              onChanged: (val) {
                postOptions.mannerRestriction = val;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text("매너 온도 36.5°C 이상의 유저만 채팅방에 입장할 수 있습니다."),
      ],
    );
  }
}
