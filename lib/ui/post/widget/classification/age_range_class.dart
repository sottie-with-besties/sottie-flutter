import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail/age_range.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class AgeClass extends StatelessWidget {
  const AgeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ClassificationTitle(title: '나이'),
        SizedBox(width: 30),
        _AgeRange(),
      ],
    );
  }
}

class _AgeRange extends StatefulWidget {
  const _AgeRange();

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
              makePostDetailEntity.ageRange = tempList;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
