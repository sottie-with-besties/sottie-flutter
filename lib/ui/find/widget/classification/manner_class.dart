import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class MannerClass extends StatefulWidget {
  const MannerClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<MannerClass> createState() => _MannerClassState();
}

class _MannerClassState extends State<MannerClass> {
  double mannerPoint = 36.5;
  final focusNode = FocusNode();
  final textController = TextEditingController();

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textController.text = mannerPoint.toString();
    textController.addListener(() {
      late double tempPoint;

      try {
        tempPoint = double.parse(textController.text);
      } on Exception catch (_) {
        tempPoint = 0;
      }

      if (tempPoint < 0) {
        mannerPoint = 0;
      } else if (tempPoint > 100) {
        mannerPoint = 100;
      } else {
        mannerPoint = tempPoint;
      }

      widget.classification.manner = mannerPoint;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "매너 온도",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Slider(
                max: 100,
                divisions: 1000,
                value: mannerPoint,
                onChanged: (val) {
                  mannerPoint =
                      (val * 10).roundToDouble() / 10; // 소수점 둘째 자리에서 반올림
                  textController.text = mannerPoint.toString();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(
                offset: const Offset(0, -12), child: const Text("0: 매너 제한 없음")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -12),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          mannerPoint =
                              ((mannerPoint - 0.1) * 10).roundToDouble() / 10;
                          if (mannerPoint < 0) {
                            mannerPoint = 0;
                          }
                          textController.text = mannerPoint.toString();
                          setState(() {});
                        },
                        child: const FaIcon(FontAwesomeIcons.minus),
                      ),
                      const SizedBox(width: 25),
                      InkWell(
                        onTap: () {
                          mannerPoint =
                              ((mannerPoint + 0.1) * 10).roundToDouble() / 10;

                          if (mannerPoint > 100) {
                            mannerPoint = 100;
                          }

                          textController.text = mannerPoint.toString();
                          setState(() {});
                        },
                        child: const FaIcon(FontAwesomeIcons.plus),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 100,
                      child: LocalTextField(
                        focusNode: focusNode,
                        controller: textController,
                        prefixIcon: false,
                        inputFormatter: <TextInputFormatter>[
                          // ChatGPT가 알려준 숫자와 소숫점 첫째 자리까지 double 타입의 인풋만 입력 받을 수 있는 정규 표현식
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d{0,2}\.?\d?'))
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -12),
                      child: const Text(
                        "이상",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
