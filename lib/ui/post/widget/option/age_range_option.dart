import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_age_range.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
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
    double animatedContainerHeight = postOptions.ageRestriction ? 50 * hu : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: '나이 제한'),
            Switch(
              activeColor: mainBlueColor,
              value: postOptions.ageRestriction,
              onChanged: (val) {
                postOptions.ageRestriction = val;

                /// 나이 제한 off 일 때
                if (val == true) {
                  postOptions.ageFrom = 1;
                  postOptions.ageTo = 1;
                } else {
                  postOptions.ageFrom = 0;
                  postOptions.ageTo = 0;
                }
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
          child: _AgeRange(isSelected: postOptions.ageRestriction),
        ),
      ],
    );
  }
}

class _AgeRange extends StatefulWidget {
  const _AgeRange({required this.isSelected});

  final bool isSelected;

  @override
  State<_AgeRange> createState() => _AgeRangeState();
}

class _AgeRangeState extends State<_AgeRange> {
  List<bool> selectedList = List<bool>.generate(
    PostAgeRange.values.length,
    (index) => false,
  );

  @override
  void initState() {
    super.initState();

    /// 검색 스크린에서 필터링 시 데이터 유지
    if (widget.isSelected == true) {
      for (int i = postOptions.ageFrom; i <= postOptions.ageTo; i++) {
        selectedList[i - 1] = true;
      }
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant _AgeRange oldWidget) {
    if (widget.isSelected == true) {
      for (int i = 0; i < selectedList.length; i++) {
        if (i == 0) {
          selectedList[i] = true;
        } else {
          selectedList[i] = false;
        }
      }

      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FittedBox(
            child: Row(
              children: PostAgeRange.values.map((age) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(age.name),
                    selected: selectedList[age.index],
                    onSelected: (onSelected) {
                      /// 칩을 눌렀을 때 최소와 최대 사이의 칩이 모두 선택되어야 한다.
                      /// ex) 10대, 40대 선택 -> 10대, 20대, 30대, 40대

                      if (onSelected) {
                        /// 칩을 on 했을 때
                        /// index + 1이 ageFrom보다 작다면 ageFrom = index + 1
                        /// index + 1이 ageTo보다 크다면 ageTo = index + 1

                        if (age.index + 1 < postOptions.ageFrom) {
                          postOptions.ageFrom = age.index + 1;
                        } else if (age.index + 1 > postOptions.ageTo) {
                          postOptions.ageTo = age.index + 1;
                        }
                      } else {
                        /// 칩을 off 했을 때
                        /// index + 1이 ageFrom과 ageTo 사이에 있다면 동작하지 않는다.
                        /// ageTo와 ageFrom이 같다면 동작하지 않는다.(하나는 선택되게)
                        /// index + 1이 ageFrom라면 ageFrom++
                        /// index + 1이 ageTo라면 ageTo--

                        if (age.index + 1 > postOptions.ageFrom &&
                                age.index + 1 < postOptions.ageTo ||
                            postOptions.ageFrom == postOptions.ageTo) {
                          return;
                        } else if (age.index + 1 == postOptions.ageFrom) {
                          selectedList[age.index] = false;
                          postOptions.ageFrom++;
                        } else if (age.index + 1 == postOptions.ageTo) {
                          selectedList[age.index] = false;
                          postOptions.ageTo--;
                        }
                      }

                      for (int i = postOptions.ageFrom;
                          i <= postOptions.ageTo;
                          i++) {
                        selectedList[i - 1] = true;
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
