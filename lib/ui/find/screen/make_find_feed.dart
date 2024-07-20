import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/classification.dart';
import 'package:sottie_flutter/domain/find/classification_entity/gender_restrictions.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/find/widget/classification/age_range_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/gender_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/location_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/manner_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/num_of_member_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/only_my_friends_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/open_participation_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/start_same_time_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/time_class.dart';

class MakeFindFeed extends StatefulWidget {
  const MakeFindFeed({super.key});

  @override
  State<MakeFindFeed> createState() => _MakeFindFeedState();
}

class _MakeFindFeedState extends State<MakeFindFeed> {
  Classification classification = Classification();

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  // 설정이 이상 없는 지 확인, 에러 내용을 String으로 담아둠
  List<String> checkList = <String>[];

  // 세팅에 문제가 있으면 에러 내용을 checkList에 담고 다이얼로그 띄우기.
  void checkIfSettingHasError() {
    if (classification.ageRange.isEmpty) {
      checkList.add("나이 범위를 최소 하나 이상 설정해주세요.");
    }

    if (classification.date == null) {
      checkList.add("날짜 및 시간을 설정해주세요.");
    }

    if (classification.gender == GenderRestrictions.nobody) {
      checkList.add("성별을 최소 하나 이상 선택해주세요.");
    }

    if (classification.category.isEmpty) {
      checkList.add("카테고리를 최소 하나 이상 선택해주세요.");
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryClass(classification: classification),
                const SizedBox(height: 20),
                LocationClass(classification: classification),
                const SizedBox(height: 20),
                DateClass(classification: classification),
                const SizedBox(height: 20),
                TimeClass(classification: classification),
                const SizedBox(height: 20),
                NumOfMemberClass(
                    classification: classification, focusNode: focusNode),
                const SizedBox(height: 20),
                GenderClass(classification: classification),
                const SizedBox(height: 20),
                AgeClass(classification: classification),
                const SizedBox(height: 20),
                MannerClass(classification: classification),
                const SizedBox(height: 20),
                StartSameTimeClass(classification: classification),
                const SizedBox(height: 20),
                OpenParticipationClass(classification: classification),
                const SizedBox(height: 20),
                OnlyMyFriendsClass(classification: classification),
                const SizedBox(height: 30),
                LocalTextField(
                  hint: "제목",
                  prefixIcon: false,
                  controller: titleController,
                ),
                LocalTextField(
                  prefixIcon: false,
                  hint: "내용을 입력하세요.",
                  lines: 12,
                  controller: contentController,
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    log(classification.category.toString(), name: "분류");
                    log(classification.location.toString(), name: "장소");
                    log(classification.date.toString(), name: "날짜 및 시간");
                    log(classification.gender.toString(), name: "성별");
                    log(classification.genderRatio.toString(), name: "성비");
                    log(classification.numOfMan.toString(), name: "남자 수");
                    log(classification.numOfWoman.toString(), name: "여자 수");
                    log(classification.numOfMember.toString(), name: "인원 수");
                    log(classification.ageRange.toString(), name: "나이대");
                    log(classification.manner.toString(), name: "매너 온도");
                    log(classification.startSameTime.toString(),
                        name: "동시 채팅 시작");
                    log(classification.openParticipation.toString(),
                        name: "오픈 채팅");
                    log(classification.onlyMyFriends.toString(), name: "내 친구만");

                    checkList.clear();
                    checkIfSettingHasError();
                    log(checkList.toString());

                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, a1, a2) => Container(),
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionBuilder: (context, a1, a2, child) {
                        return ScaleTransition(
                          scale: a1,
                          child: AlertDialog(
                            scrollable: true,
                            content: SizedBox(
                              width: 300,
                              height: 400,
                              child: checkList.isEmpty
                                  ? const Center(
                                      child: Text("에러가 없으므로 모집글 완성본 미리보여주기"),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 32),
                                      child: Column(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 32,
                                                      horizontal: 16),
                                              child: Text(errorString),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  minimumSize: const Size(100, 50),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "취소",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainSilverColor),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "생성",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainSilverColor),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "모집글 생성",
                    style: TextStyle(
                      color: mainSilverColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
