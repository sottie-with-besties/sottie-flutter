import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/find/classification_entity/age_range.dart';
import 'package:sottie_flutter/domain/find/classification_entity/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

class AgeClass extends StatelessWidget {
  const AgeClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ClassificationTitle(title: '나이'),
        const SizedBox(width: 30),
        _AgeRange(classification: classification),
      ],
    );
  }
}

class _AgeRange extends StatefulWidget {
  const _AgeRange({
    required this.classification,
  });

  final Classification classification;

  @override
  State<_AgeRange> createState() => _AgeRangeState();
}

class _AgeRangeState extends State<_AgeRange> {
  List<bool> selectedList = List<bool>.generate(
    AgeRangeSottie.values.length,
    (index) => false,
  );

  List<AgeRangeSottie> tempList = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 10,
        children: AgeRangeSottie.values.map((age) {
          return ChoiceChip(
            label: Text(age.name),
            selected: selectedList[age.index],
            onSelected: (onSelected) {
              selectedList[age.index] = onSelected;
              onSelected ? tempList.add(age) : tempList.remove(age);
              widget.classification.ageRange = tempList;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
