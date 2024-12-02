import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_age_range.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class AgeOption extends StatefulWidget {
  const AgeOption({super.key});

  @override
  State<AgeOption> createState() => _AgeOptionState();
}

class _AgeOptionState extends State<AgeOption> {
  @override
  Widget build(BuildContext context) {
    double animatedContainerHeight =
        postSettingEntity.ageRestriction ? 50 * hu : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: '나이 제한'),
            Switch(
              activeColor: mainBlueColor,
              value: postSettingEntity.ageRestriction,
              onChanged: (val) {
                postSettingEntity.ageRestriction = val;
                setState(() {});
              },
            ),
          ],
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            height: animatedContainerHeight,
            padding: EdgeInsets.only(top: 12 * hu),
            child: const _AgeRange()),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          FittedBox(
            child: Row(
              children: SottieAgeRange.values.map((age) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
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
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
