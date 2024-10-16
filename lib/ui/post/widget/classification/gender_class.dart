import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class GenderClass extends ConsumerStatefulWidget {
  const GenderClass({super.key});

  @override
  ConsumerState<GenderClass> createState() => _GenderClassState();
}

class _GenderClassState extends ConsumerState<GenderClass> {
  bool _sliderCondition(double val) =>
      postSettingEntity.genderRatio &&
      val.toInt() != postSettingEntity.numOfMember &&
      val.toInt() != 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(numOfMemberProvider, (_, numOfMember) {
      /// 유저가 numOfMember를 10에서 5로 골랐을 때(큰 수에서 작은 수) Slider의 Value에러 방지
      postSettingEntity.numOfMan = (numOfMember / 2).floorToDouble().toInt();
      postSettingEntity.numOfWoman = numOfMember - postSettingEntity.numOfMan;
      setState(() {});
    });

    double animatedContainerHeight =
        postSettingEntity.genderRatio ? 80 * hu : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: '성비 제한'),
            Switch(
              activeColor: mainBlueColor,
              value: postSettingEntity.genderRatio,
              onChanged: (val) {
                postSettingEntity.genderRatio = val;
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
                    value: postSettingEntity.numOfMan.toDouble(),
                    max: postSettingEntity.numOfMember.toDouble(),
                    divisions: postSettingEntity.numOfMember,
                    activeColor: mainBlueColor,
                    inactiveColor: mainRedColor,
                    thumbColor: mainBlackColor,
                    onChanged: (val) {
                      if (_sliderCondition(val)) {
                        postSettingEntity.numOfMan = val.toInt();
                        postSettingEntity.numOfWoman =
                            (postSettingEntity.numOfMember - val).toInt();
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
                            "남자 ${postSettingEntity.numOfMan}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         if (postSettingEntity.numOfMan <
                      //             postSettingEntity.numOfMember) {
                      //           postSettingEntity.numOfMan += 1;
                      //           setState(() {});
                      //         }
                      //       },
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.plus,
                      //         color: Colors.blueAccent,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 60 * wu,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         if (postSettingEntity.numOfMan > 0) {
                      //           postSettingEntity.numOfMan -= 1;
                      //           setState(() {});
                      //         }
                      //       },
                      //       child: const FaIcon(
                      //         FontAwesomeIcons.plus,
                      //         color: mainRedColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            "${postSettingEntity.numOfMember - postSettingEntity.numOfMan} 여자",
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
