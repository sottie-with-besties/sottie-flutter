import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sottie_flutter/domain/find/classification_entity/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

class NumOfMemberClass extends StatelessWidget {
  const NumOfMemberClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "인원 수"),
        const SizedBox(width: 20),
        _NumOfMemberSelector(classification: classification),
      ],
    );
  }
}

class _NumOfMemberSelector extends StatefulWidget {
  const _NumOfMemberSelector({
    required this.classification,
  });

  final Classification classification;

  @override
  State<_NumOfMemberSelector> createState() => _NumOfMemberSelectorState();
}

class _NumOfMemberSelectorState extends State<_NumOfMemberSelector> {
  final entries = List.generate(12, (index) {
    if (index == 0) {
      return "제한 없음";
    } else if (index == 11) {
      return "직접 입력";
    } else {
      return index;
    }
  });

  String focusVal = '';

  final controller = TextEditingController();
  final focusNode = FocusNode();

  void _focusNodeListener() {
    if (focusNode.hasFocus && focusVal != '직접 입력') {
      focusNode.unfocus();
    }
  }

  void _controllerListener() {
    int num = 0;
    if (controller.text == "제한 없음" ||
        controller.text == "직접 입력" ||
        controller.text == "") {
      num = 0;
    } else {
      num = int.parse(controller.text);
    }
    widget.classification.numOfMember = num;
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_focusNodeListener);
    controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    focusNode.removeListener(_focusNodeListener);
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: 0,
      menuHeight: 200,
      controller: controller,
      focusNode: focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      requestFocusOnTap: false,
      dropdownMenuEntries: entries
          .map((val) => DropdownMenuEntry(
              value: val == "제한 없음" ? 0 : val, label: val.toString()))
          .toList(),
      onSelected: (val) {
        focusVal = val.toString();
        if (val == "직접 입력") {
          controller.clear();
          focusNode.requestFocus();
        } else {
          focusNode.unfocus();
          widget.classification.numOfMember = int.parse(val.toString());
        }
      },
    );
  }
}
