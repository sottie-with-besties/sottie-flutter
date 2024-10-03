import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class OpenParticipationClass extends StatefulWidget {
  const OpenParticipationClass({super.key});

  @override
  State<OpenParticipationClass> createState() => _OpenParticipationClassState();
}

class _OpenParticipationClassState extends State<OpenParticipationClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: "오픈 채팅"),
            Switch(
              activeColor: mainBrownColor,
              value: postSettingEntity.openParticipation,
              onChanged: (val) {
                postSettingEntity.openParticipation = val;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
            "오픈 채팅방으로 설정하여 입장 조건에 부합하는 유저가 상시 입장할 수 있으며 퇴장에 패널티를 부여하지 않습니다. 모임 날짜와 관계 없이 채팅방이 유지됩니다."),
      ],
    );
  }
}
