import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class MannerClass extends StatefulWidget {
  const MannerClass({super.key});

  @override
  State<MannerClass> createState() => _MannerClassState();
}

class _MannerClassState extends State<MannerClass> {
  int sliderValue = 2;
  List<double> mannerPoint = <double>[0, 18.5, 36.5, 52.5, 70.5, 88.5, 100];

  String _renderMannerPointText() {
    if (sliderValue == 0) {
      return "제한 없음";
    } else if (sliderValue == 6) {
      return "완벽한 사람만";
    } else {
      return "${mannerPoint[sliderValue]} 이상";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: "매너 온도"),
            const SizedBox(width: 15),
            Expanded(
              child: Slider(
                max: 6,
                divisions: 6,
                value: sliderValue.toDouble(),
                onChanged: (val) {
                  sliderValue = val.toInt();
                  makePostDetailEntity.manner = mannerPoint[sliderValue];
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _renderMannerPointText(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 12 * wu),
          ],
        ),
      ],
    );
  }
}
