import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_gender_restriction.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class GenderOption extends ConsumerStatefulWidget {
  const GenderOption({super.key});

  @override
  ConsumerState<GenderOption> createState() => _GenderClassState();
}

class _GenderClassState extends ConsumerState<GenderOption> {
  bool _peopleNumIsSelected = false;

  bool _sliderCondition() =>
      postOptions.genderRestriction != PostGenderRestriction.NONE &&
      _peopleNumIsSelected;

  @override
  void initState() {
    super.initState();
    postOptions.genderRestriction == PostGenderRestriction.NONE
        ? _peopleNumIsSelected = false
        : _peopleNumIsSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(numOfMemberProvider, (_, peopleNum) {
      if (peopleNum == 1) {
        _peopleNumIsSelected = false;
        postOptions.genderRestriction = PostGenderRestriction.NONE;
        postOptions.maleNum = 0;
        postOptions.femaleNum = 0;
      } else {
        _peopleNumIsSelected = true;

        if (postOptions.genderRestriction != PostGenderRestriction.NONE) {
          /// 유저가 numOfMember를 10에서 5로 골랐을 때(큰 수에서 작은 수) Slider의 Value에러 방지
          postOptions.maleNum = (peopleNum / 2).floorToDouble().toInt();
          postOptions.femaleNum = peopleNum - postOptions.maleNum;
        }
      }

      setState(() {});
    });

    double animatedContainerHeight =
        postOptions.genderRestriction != PostGenderRestriction.NONE
            ? 80 * hu
            : 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OptionTitle(title: '성비 제한'),
            Switch(
              activeColor: mainBlueColor,
              value: _sliderCondition(),
              onChanged: (val) {
                if (_peopleNumIsSelected) {
                  if (val == true) {
                    postOptions.genderRestriction = PostGenderRestriction.MIX;

                    /// 유저가 numOfMember를 10에서 5로 골랐을 때(큰 수에서 작은 수) Slider의 Value에러 방지
                    postOptions.maleNum =
                        (postOptions.peopleNum / 2).floorToDouble().toInt();
                    postOptions.femaleNum =
                        postOptions.peopleNum - postOptions.maleNum;
                  } else {
                    postOptions.genderRestriction = PostGenderRestriction.NONE;
                    postOptions.maleNum = 0;
                    postOptions.femaleNum = 0;
                  }
                  setState(() {});
                }
              },
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          height: animatedContainerHeight,
          padding: EdgeInsets.only(top: 12 * hu),
          child: _peopleNumIsSelected
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Slider(
                        value: postOptions.maleNum.toDouble(),
                        max: postOptions.peopleNum.toDouble(),
                        divisions: postOptions.peopleNum,
                        activeColor: mainBlueColor,
                        inactiveColor: mainRedColor,
                        thumbColor: mainBlackColor,
                        onChanged: (val) {
                          if (_sliderCondition()) {
                            postOptions.maleNum = val.toInt();
                            postOptions.femaleNum =
                                (postOptions.peopleNum - val).toInt();

                            if (postOptions.maleNum == postOptions.peopleNum) {
                              postOptions.genderRestriction =
                                  PostGenderRestriction.MALE;
                            } else if (postOptions.femaleNum ==
                                postOptions.peopleNum) {
                              postOptions.genderRestriction =
                                  PostGenderRestriction.FEMALE;
                            } else {
                              postOptions.genderRestriction =
                                  PostGenderRestriction.MIX;
                            }

                            setState(() {});
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  "남자 ${postOptions.maleNum}",
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
                                  "${postOptions.peopleNum - postOptions.maleNum} 여자",
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
                      ),
                      if (postOptions.genderRestriction ==
                          PostGenderRestriction.MALE)
                        Text(
                          '남자만 입장 가능',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10 * hu,
                            color: mainBlueColor,
                          ),
                        ),
                      if (postOptions.genderRestriction ==
                          PostGenderRestriction.FEMALE)
                        Text(
                          '여자만 입장 가능',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10 * hu,
                            color: mainRedColor,
                          ),
                        ),
                    ],
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
