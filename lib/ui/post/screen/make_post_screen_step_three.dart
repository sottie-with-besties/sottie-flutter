import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_location.dart';
import 'package:sottie_flutter/domain/post/make_post_send.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class MakePostScreenStepThree extends StatelessWidget {
  const MakePostScreenStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("미리 보기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postSettingEntity.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30 * hu),
              Text(
                postSettingEntity.contents,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30 * hu),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("카테고리: ${postSettingEntity.gatheringCategory.name}"),
                  Text(
                      "날짜: ${postSettingEntity.gatheringDate == null ? "날짜 정보 없음" : convertDateTimeIntoString(postSettingEntity.gatheringDate!.toLocal())}"),
                  Text(
                      "장소: ${SottieLocation.values[postSettingEntity.locationId].name}"),
                  postSettingEntity.ageRestriction
                      ? Text(
                          "나이: ${convertAgeRangeToString(postSettingEntity.ageFrom, postSettingEntity.ageTo)}")
                      : const Text("나이 제한 없음"),
                  Text(
                      "참여 인원: ${postSettingEntity.peopleNum == 0 ? "제한 없음" : postSettingEntity.peopleNum}"),
                  if (postSettingEntity.genderRestriction != 'NONE')
                    Text(
                        "남자: ${postSettingEntity.maleNum}명 / 여자: ${postSettingEntity.femaleNum}명"),
                  if (postSettingEntity.mannerRestriction)
                    const Text("매너 온도 제한: 매너온도가 36.5°C 이상인 유저만 입장할 수 있습니다."),
                  if (postSettingEntity.onlyMyFriends)
                    const Text("내 친구만 입장: 작성자의 친구만 입장할 수 있습니다."),
                ],
              ),
              SizedBox(height: 15 * hu),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final makePostSuccess = await makePostSend();

                        if (context.mounted) {
                          if (makePostSuccess) {
                            await showCustomDialog(
                              context,
                              const Center(
                                child: Text('모집글을 작성했습니다'),
                              ),
                            );
                            context.mounted
                                ? context.go(CustomRouter.homePath)
                                : null;

                            // Todo: 유저 골드 차감
                          } else {
                            showSnackBar(context, '모집글 생성 실패');
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
