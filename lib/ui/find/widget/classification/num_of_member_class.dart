import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class NumOfMemberClass extends StatelessWidget {
  const NumOfMemberClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NumOfMemberSelect(
          tag: "최소 인원 수",
          classification: classification,
        ),
        const SizedBox(
          height: 20,
        ),
        _NumOfMemberSelect(
          tag: "최대 인원 수",
          classification: classification,
        ),
      ],
    );
  }
}

class _NumOfMemberSelect extends StatefulWidget {
  const _NumOfMemberSelect({
    required this.tag,
    required this.classification,
  });

  final String tag;
  final Classification classification;

  @override
  State<_NumOfMemberSelect> createState() => _NumOfMemberSelectState();
}

class _NumOfMemberSelectState extends State<_NumOfMemberSelect> {
  final entries = List.generate(12, (index) {
    if (index == 0) {
      return "제한 없음";
    } else if (index == 11) {
      return "직접 입력";
    } else {
      return index;
    }
  });

  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int num = 0;
      if (controller.text == "제한 없음" ||
          controller.text == "직접 입력" ||
          controller.text == "") {
        num = 0;
      } else {
        num = int.parse(controller.text);
      }
      if (widget.tag == "최소 인원 수") {
        widget.classification.minNumOfMember = num;
      } else {
        widget.classification.maxNumOfMember = num;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.tag,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: DropdownMenu(
            initialSelection: 0,
            menuHeight: 200,
            controller: controller,
            focusNode: focusNode,
            requestFocusOnTap: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            dropdownMenuEntries: entries
                .map((val) => DropdownMenuEntry(
                    value: val == "제한 없음" ? 0 : val, label: val.toString()))
                .toList(),
            onSelected: (val) {
              if (val == "직접 입력") {
                controller.clear();
                focusNode.requestFocus();
              } else {
                focusNode.unfocus();
              }
            },
          ),
        ),
      ],
    );
  }
}
