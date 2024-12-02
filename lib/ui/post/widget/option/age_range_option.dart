import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_age_range.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class AgeOption extends StatelessWidget {
  const AgeOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        OptionTitle(title: '나이'),
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
    SottieAgeRange.values.length,
    (index) => false,
  );

  List<int> tempList = [];

  @override
  void initState() {
    super.initState();

    /// 검색 스크린에서 필터링 시 데이터 유지
    for (int i in postSettingEntity.ageRange) {
      selectedList[i] = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 10,
        children: SottieAgeRange.values.map((age) {
          return ChoiceChip(
            label: Text(age.name),
            selected: selectedList[age.index],
            onSelected: (onSelected) {
              if (age.index == 0) {
                selectedList[0] = true;
                for (int i = 1; i < selectedList.length; i++) {
                  selectedList[i] = false;
                }
                tempList = <int>[0];
                postSettingEntity.ageRange = tempList;
              } else {
                if (postSettingEntity.ageRange[0] == 0) {
                  tempList = <int>[];
                }
                selectedList[0] = false;
                selectedList[age.index] = onSelected;
                if (onSelected) {
                  tempList.add(age.index);
                } else {
                  tempList.remove(age.index);

                  if (tempList.isEmpty) {
                    tempList = <int>[0];
                    selectedList[0] = true;
                  }
                }
                postSettingEntity.ageRange = tempList;
              }

              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
