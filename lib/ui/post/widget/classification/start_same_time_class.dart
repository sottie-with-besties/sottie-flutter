import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/classification_entity/classification.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class StartSameTimeClass extends StatefulWidget {
  const StartSameTimeClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<StartSameTimeClass> createState() => _StartSameTimeClassState();
}

class _StartSameTimeClassState extends State<StartSameTimeClass> {
  bool startSameTime = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: "동시 채팅 시작"),
            Switch(
              activeColor: mainBrownColor,
              value: startSameTime,
              onChanged: (val) {
                startSameTime = val;
                widget.classification.startSameTime = startSameTime;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
            "이 옵션을 설정하면 유저가 방에 들어오는 대로 채팅을 시작하는 것이 아닌, 설정한 인원 수 만큼 유저가 모이면 채팅이 동시에 시작됩니다."),
      ],
    );
  }
}
