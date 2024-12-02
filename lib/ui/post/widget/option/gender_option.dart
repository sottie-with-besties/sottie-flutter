import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class GenderOption extends ConsumerStatefulWidget {
  const GenderOption({super.key});

  @override
  ConsumerState<GenderOption> createState() => _GenderClassState();
}

class _GenderClassState extends ConsumerState<GenderOption> {
  bool _sliderCondition(double val) =>
      postSettingEntity.genderRestriction != 'NONE' &&
      val.toInt() != postSettingEntity.peopleNum &&
      val.toInt() != 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(numOfMemberProvider, (_, peopleNum) {
      /// 유저가 numOfMember를 10에서 5로 골랐을 때(큰 수에서 작은 수) Slider의 Value에러 방지
      postSettingEntity.maleNum = (peopleNum / 2).floorToDouble().toInt();
      postSettingEntity.femaleNum = peopleNum - postSettingEntity.maleNum;
      setState(() {});
    });

    double animatedContainerHeight =
        postSettingEntity.genderRestriction != 'NONE' ? 80 * hu : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: '성비 제한'),
            Switch(
              activeColor: mainBlueColor,
              value: postSettingEntity.genderRestriction != 'NONE',
              onChanged: (val) {
                postSettingEntity.genderRestriction = val ? 'MALE' : 'NONE';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Slider(
                    value: postSettingEntity.maleNum.toDouble(),
                    max: postSettingEntity.peopleNum.toDouble(),
                    divisions: postSettingEntity.peopleNum,
                    activeColor: mainBlueColor,
                    inactiveColor: mainRedColor,
                    thumbColor: mainBlackColor,
                    onChanged: (val) {
                      if (_sliderCondition(val)) {
                        postSettingEntity.maleNum = val.toInt();
                        postSettingEntity.femaleNum =
                            (postSettingEntity.peopleNum - val).toInt();
                        setState(() {});
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            "남자 ${postSettingEntity.maleNum}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            "${postSettingEntity.peopleNum - postSettingEntity.maleNum} 여자",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
