import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_detail/gender_restrictions.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/post/widget/classification/age_range_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/gender_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/location_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/manner_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/num_of_member_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/only_my_friends_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/open_participation_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/start_same_time_class.dart';
import 'package:sottie_flutter/ui/post/widget/classification/time_class.dart';

class MakePostScreenStepTwo extends StatefulWidget {
  const MakePostScreenStepTwo({super.key});

  @override
  State<MakePostScreenStepTwo> createState() => _MakePostScreenStepTwoState();
}

class _MakePostScreenStepTwoState extends State<MakePostScreenStepTwo> {
  final FocusNode focusNode = FocusNode();

  // 설정이 이상 없는 지 확인, 에러 내용을 String으로 담아둠
  List<String> checkList = <String>[];

  // 세팅에 문제가 있으면 에러 내용을 checkList에 담고 다이얼로그 띄우기.
  void checkIfSettingHasError() {
    if (makePostDetailEntity.ageRange.isEmpty) {
      checkList.add("나이 범위를 최소 하나 이상 설정해주세요.");
    }

    if (makePostDetailEntity.date == null) {
      checkList.add("날짜 및 시간을 설정해주세요.");
    }

    if (makePostDetailEntity.gender == GenderRestrictions.nobody) {
      checkList.add("성별을 최소 하나 이상 선택해주세요.");
    }

    if (makePostDetailEntity.category.isEmpty) {
      checkList.add("카테고리를 최소 하나 이상 선택해주세요.");
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "환경 설정",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CategoryClass(),
                const SizedBox(height: 20),
                const LocationClass(),
                const SizedBox(height: 20),
                const DateClass(),
                const SizedBox(height: 20),
                const TimeClass(),
                const SizedBox(height: 20),
                NumOfMemberClass(focusNode: focusNode),
                const SizedBox(height: 20),
                const GenderClass(),
                const SizedBox(height: 20),
                const AgeClass(),
                const SizedBox(height: 20),
                const MannerClass(),
                const SizedBox(height: 20),
                const StartSameTimeClass(),
                const SizedBox(height: 20),
                const OpenParticipationClass(),
                const SizedBox(height: 20),
                const OnlyMyFriendsClass(),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    checkList.clear();
                    checkIfSettingHasError();

                    checkList.isEmpty
                        ? context.push(CustomRouter.findDetailPath, extra: [
                            '모집글 생성',
                            () {
                              log("모집글 생성");
                            }
                          ])
                        : showCustomDialog(
                            context,
                            Column(
                              children: [
                                const Text(
                                  "설정을 다시 확인해주세요",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                ...checkList.map((errorString) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 32, horizontal: 16),
                                    child: Text(errorString),
                                  );
                                }),
                              ],
                            ),
                          );
                  },
                  child: const Text(
                    "다음 2/3",
                    style: TextStyle(
                      color: mainSilverColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
