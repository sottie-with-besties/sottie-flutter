import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_category.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/post/widget/option/age_range_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/category_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/date_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/gender_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/location_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/manner_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/num_of_member_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/only_my_friends_option.dart';
import 'package:sottie_flutter/ui/post/widget/option/time_option.dart';

class MakePostScreenStepTwo extends StatefulWidget {
  const MakePostScreenStepTwo({super.key});

  @override
  State<MakePostScreenStepTwo> createState() => _MakePostScreenStepTwoState();
}

class _MakePostScreenStepTwoState extends State<MakePostScreenStepTwo> {
  final FocusNode focusNode = FocusNode();

  /// 에러 내용을 String으로 담아두어 다음 페이지로 넘어 갈 수 없는 이유 설명
  List<String> checkList = <String>[];

  /// 세팅에 문제가 있으면 에러 내용을 checkList에 담고 다이얼로그 띄우기.
  void checkIfSettingHasError() {
    if (postSettingEntity.gatheringDate == null) {
      checkList.add("날짜 및 시간을 선택해주세요.");
    }

    if (postSettingEntity.gatheringCategory == SottieCategory.all) {
      checkList.add("카테고리를 하나 선택해주세요.");
    }

    if (postSettingEntity.peopleNum == 0) {
      checkList.add("인원 수를 설정해주세요");
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
          title: const Text("채팅방 환경 설정"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CategoryOption(),
                const SizedBox(height: 20),
                const LocationOption(),
                const SizedBox(height: 20),
                const DateOption(),
                const SizedBox(height: 20),
                const TimeOption(),
                const SizedBox(height: 20),
                const NumOfMemberOption(),
                const SizedBox(height: 20),
                const GenderOption(),
                const SizedBox(height: 20),
                const AgeOption(),
                const SizedBox(height: 20),
                const MannerOption(),
                const SizedBox(height: 20),
                const OnlyMyFriendsOption(),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    checkList.clear();
                    checkIfSettingHasError();

                    checkList.isEmpty
                        ? context.push(
                            "${CustomRouter.makePostStepOnePath}/${CustomRouter.makePostStepTwoPath}/${CustomRouter.makePostStepThreePath}/")
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
                  child: const Text("다음 2/3"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
