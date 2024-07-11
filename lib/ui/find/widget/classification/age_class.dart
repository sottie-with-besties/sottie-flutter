import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class AgeClass extends StatelessWidget {
  const AgeClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AgeSelector(
          tag: "최소 나이",
          classification: classification,
        ),
        const SizedBox(
          height: 20,
        ),
        _AgeSelector(
          tag: "최대 나이",
          classification: classification,
        ),
      ],
    );
  }
}

class _AgeSelector extends StatefulWidget {
  const _AgeSelector({
    required this.tag,
    required this.classification,
  });

  final String tag;
  final Classification classification;

  @override
  State<_AgeSelector> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<_AgeSelector> {
  final entries = List.generate(101, (index) {
    if (index == 0) {
      return "제한 없음";
    } else {
      return index;
    }
  });

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
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
        DropdownMenu(
          initialSelection: 0,
          menuHeight: 200,
          controller: controller,
          requestFocusOnTap: false,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          dropdownMenuEntries: entries
              .map((val) => DropdownMenuEntry(
                  value: val == "제한 없음" ? 0 : val, label: val.toString()))
              .toList(),
          onSelected: (val) {
            if (widget.tag == "최소 나이") {
              widget.classification.minAge = int.parse(val.toString());
            } else {
              widget.classification.maxAge = int.parse(val.toString());
            }
          },
        ),
      ],
    );
  }
}
