import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail/gender_restrictions.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class GenderClass extends StatefulWidget {
  const GenderClass({super.key});

  @override
  State<GenderClass> createState() => _GenderClassState();
}

class _GenderClassState extends State<GenderClass> {
  @override
  Widget build(BuildContext context) {
    double animatedContainerHeight =
        postSettingEntity.gender == GenderRestrictions.all ? 120 * hu : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClassificationTitle(title: "성별"),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _GenderButton(
                      gender: "남자",
                      classificationCallback: () {
                        switch (postSettingEntity.gender) {
                          case GenderRestrictions.all:
                            postSettingEntity.gender =
                                GenderRestrictions.womanOnly;
                            break;
                          case GenderRestrictions.manOnly:
                            postSettingEntity.gender =
                                GenderRestrictions.nobody;
                            break;
                          case GenderRestrictions.womanOnly:
                            postSettingEntity.gender = GenderRestrictions.all;
                            break;
                          case GenderRestrictions.nobody:
                            postSettingEntity.gender =
                                GenderRestrictions.manOnly;
                            break;
                          default:
                            postSettingEntity.gender = GenderRestrictions.all;
                            break;
                        }
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    _GenderButton(
                      gender: "여자",
                      classificationCallback: () {
                        switch (postSettingEntity.gender) {
                          case GenderRestrictions.all:
                            postSettingEntity.gender =
                                GenderRestrictions.manOnly;
                            break;
                          case GenderRestrictions.manOnly:
                            postSettingEntity.gender = GenderRestrictions.all;
                            break;
                          case GenderRestrictions.womanOnly:
                            postSettingEntity.gender =
                                GenderRestrictions.nobody;
                            break;
                          case GenderRestrictions.nobody:
                            postSettingEntity.gender =
                                GenderRestrictions.womanOnly;
                            break;
                          default:
                            postSettingEntity.gender = GenderRestrictions.all;
                            break;
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        _GenderRatio(height: animatedContainerHeight),
      ],
    );
  }
}

class _GenderButton extends StatefulWidget {
  const _GenderButton({
    required this.gender,
    required this.classificationCallback,
  });

  final String gender;
  final VoidCallback classificationCallback;

  @override
  State<_GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<_GenderButton> {
  bool isSelected = true;

  @override
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    if (postSettingEntity.gender == GenderRestrictions.all) {
      isSelected = true;
    } else if (postSettingEntity.gender == GenderRestrictions.manOnly) {
      if (widget.gender == '여자') isSelected = false;
    } else if (postSettingEntity.gender == GenderRestrictions.womanOnly) {
      if (widget.gender == '남자') isSelected = false;
    } else {
      // GenderRestrictions.nobody
      isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: isSelected
            ? null
            : ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        onPressed: () {
          isSelected = !isSelected;
          widget.classificationCallback();
          setState(() {});
        },
        child: Text(
          widget.gender,
          style: const TextStyle(
            color: mainSilverColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _GenderRatio extends ConsumerStatefulWidget {
  const _GenderRatio({
    required this.height,
  });

  final double height;

  @override
  ConsumerState<_GenderRatio> createState() => _GenderRatioState();
}

class _GenderRatioState extends ConsumerState<_GenderRatio> {
  // 슬라이더 value
  double value = 0;

  @override
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    value = postSettingEntity.numOfMan.toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // 유저가 numOfMember를 10에서 5로 골랐을 때(큰 수에서 작은 수) Slider의 Value에러 방지
    ref.listen(numOfMemberProvider, (_, newState) {
      if (value > newState) {
        value = (newState / 2).floorToDouble();
      }

      if (newState == 0) {
        postSettingEntity.genderRatio = false;
      }

      postSettingEntity.numOfMan = value.toInt();
      postSettingEntity.numOfWoman = (newState - value).toInt();
      postSettingEntity.numOfMember = newState;
      setState(() {});
    });

    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            height: widget.height,
            padding: EdgeInsets.only(top: 12 * hu),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ClassificationTitle(title: '성비 제한'),
                      Switch(
                          activeColor: mainBrownColor,
                          value: postSettingEntity.genderRatio,
                          onChanged: (val) {
                            postSettingEntity.genderRatio = val;
                            setState(() {});
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      // Todo: 현재 유져의 성별에 따라 min값 max값 설정하기
                      // Todo: ex) 현재 유저가 남성이면 min값 1, 여자면 max를 refNumOfMember - 1로
                      Slider(
                          value: postSettingEntity.genderRatio ? value : 0,
                          max: postSettingEntity.numOfMember.toDouble(),
                          divisions: postSettingEntity.genderRatio
                              ? postSettingEntity.numOfMember
                              : 1,
                          activeColor: postSettingEntity.genderRatio
                              ? Colors.blueAccent
                              : Colors.grey,
                          inactiveColor: postSettingEntity.genderRatio
                              ? Colors.redAccent
                              : Colors.grey,
                          thumbColor: postSettingEntity.genderRatio
                              ? mainBrownColor
                              : Colors.grey,
                          onChanged: (val) {
                            if (postSettingEntity.genderRatio) {
                              value = val;
                              postSettingEntity.numOfMan = value.toInt();
                              postSettingEntity.numOfWoman =
                                  (postSettingEntity.numOfMember - value)
                                      .toInt();
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
                                  "남자 ${value.toInt()}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (value < postSettingEntity.numOfMember) {
                                      value++;
                                      setState(() {});
                                    }
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 60 * wu,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (value > 0) {
                                      value--;
                                      setState(() {});
                                    }
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  "${(postSettingEntity.numOfMember - value).toInt()} 여자",
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
