import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail/age_range.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
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
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    for (AgeRangeSottie i in postSettingEntity.ageRange) {
      selectedList[i.index] = true;
    }
    setState(() {});
  }

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
              postSettingEntity.ageRange = tempList;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
