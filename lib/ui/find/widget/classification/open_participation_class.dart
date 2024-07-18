import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/model/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

class OpenParticipationClass extends StatefulWidget {
  const OpenParticipationClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<OpenParticipationClass> createState() => _OpenParticipationClassState();
}

class _OpenParticipationClassState extends State<OpenParticipationClass> {
  bool openParticipation = false;

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
              value: openParticipation,
              onChanged: (val) {
                openParticipation = val;
                widget.classification.openParticipation = openParticipation;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
            "오픈 채팅방으로 설정하여 입장 조건에 부합하는 유저가 상시 입장할 수 있습니다. 퇴장에 패널티를 부여하지 않습니다."),
      ],
    );
  }
}
