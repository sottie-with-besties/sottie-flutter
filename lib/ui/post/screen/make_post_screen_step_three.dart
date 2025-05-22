import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/use_case/post/post_use_case.dart';

class MakePostScreenStepThree extends StatelessWidget {
  const MakePostScreenStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("미리 보기")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postOptionsSetting.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30 * ScreenSize.hu),
              Text(
                postOptionsSetting.contents,
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(height: 30 * ScreenSize.hu),
              SizedBox(
                height: 150 * ScreenSize.hu,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "카테고리: ${postOptionsSetting.gatheringCategory.koreanName}",
                    ),
                    Text(
                      "날짜: ${postOptionsSetting.gatheringDate == null ? "날짜 정보 없음" : convertDateTimeIntoString(postOptionsSetting.gatheringDate!.toLocal())}",
                    ),
                    Text(
                      "장소: ${PostLocation.values[postOptionsSetting.locationId].koreanName}",
                    ),
                    postOptionsSetting.ageRestriction
                        ? Text(
                          "나이: ${convertAgeRangeToString(postOptionsSetting.ageFrom, postOptionsSetting.ageTo)}",
                        )
                        : const Text("나이 제한 없음"),
                    Text(
                      "참여 인원: ${postOptionsSetting.peopleNum == 0 ? "제한 없음" : postOptionsSetting.peopleNum}",
                    ),
                    if (postOptionsSetting.genderRestriction !=
                        PostGenderRestriction.NONE)
                      Text(
                        "남자: ${postOptionsSetting.maleNum}명 / 여자: ${postOptionsSetting.femaleNum}명",
                      ),
                    if (postOptionsSetting.mannerRestriction)
                      const Text("매너 온도 제한: 매너온도가 36.5°C 이상인 유저만 입장할 수 있습니다."),
                  ],
                ),
              ),
              SizedBox(height: 15 * ScreenSize.hu),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final makePostSuccess = await PostUseCase.makePost();

                        if (context.mounted) {
                          if (makePostSuccess) {
                            await ModalController.showCustomDialog(
                              context,
                              const Center(child: Text('모집글을 작성했습니다')),
                            );
                            context.mounted
                                ? context.go(CustomRouter.homePath)
                                : null;

                            // Todo: 유저 골드 차감
                          } else {
                            ModalController.showCustomSnackBar(
                              context,
                              '모집글 생성 실패',
                            );
                          }
                        }
                      },
                      child: const Text('모집글 생성'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
