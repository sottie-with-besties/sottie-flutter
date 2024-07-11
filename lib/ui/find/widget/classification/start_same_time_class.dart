import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

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
  final textController = TextEditingController();
  int startNumber = 0;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController.addListener(
      () {
        try {
          startNumber = int.parse(textController.text);
        } catch (e) {
          startNumber = 0;
        }

        if (formKey.currentState!.validate()) {
          widget.classification.startNumOfMember = startNumber;
        }
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "동시 채팅 시작",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Checkbox(
              activeColor: mainBrownColor,
              value: startSameTime,
              onChanged: (val) {
                startSameTime = val!;
                widget.classification.startSameTime = startSameTime;
                setState(() {});
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: textController,
                  enabled: startSameTime,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (val) {
                    if (widget.classification.minNumOfMember > startNumber ||
                        (widget.classification.maxNumOfMember != 0 &&
                            widget.classification.maxNumOfMember <
                                startNumber)) {
                      return "최소 <= n <= 최대";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const Text("명이 모이면 채팅을 시작합니다.")
          ],
        )
      ],
    );
  }
}
