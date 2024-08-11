import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail/gender_restrictions.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class MakePostScreenStepThree extends StatefulWidget {
  const MakePostScreenStepThree({super.key});

  @override
  State<MakePostScreenStepThree> createState() =>
      _MakePostScreenStepThreeState();
}

class _MakePostScreenStepThreeState extends State<MakePostScreenStepThree> {
  final controller = PageController();
  List<Image>? images;

  @override
  void initState() {
    if (postSettingEntity.images != null) {
      images = postSettingEntity.images!.map((image) {
        return Image.file(
          File(image.path),
          fit: BoxFit.cover,
        );
      }).toList();
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  if (images != null)
                    SizedBox(
                      height: 250 * hu,
                      child: PageView.builder(
                        controller: controller,
                        itemBuilder: (_, index) {
                          return images![index % images!.length];
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  if (images != null)
                    SmoothPageIndicator(
                      controller: controller,
                      count: images!.length,
                      effect: const WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: mainBrownColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                postSettingEntity.content,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "카테고리: ${postSettingEntity.convertCategoryToStringList().reduce((p, n) => "$n , $p")}"),
                    Text(
                        "참여 인원: ${postSettingEntity.numOfMember == 0 ? "제한 없음" : postSettingEntity.numOfMember}"),
                    Text(
                        "날짜: ${postSettingEntity.date == null ? "날짜 정보 없음" : postSettingEntity.date!.toString().substring(0, 16)}"),
                    Text("장소: ${postSettingEntity.location.name}"),
                    Text(
                        "나이: ${postSettingEntity.convertAgeRangeToStringList().reduce((p, n) => "$n , $p")}"),
                    Text("성별제한: ${postSettingEntity.gender.name}"),
                    if (postSettingEntity.gender == GenderRestrictions.all)
                      Text(
                          "성비제한: ${postSettingEntity.genderRatio ? "있음" : "없음"}"),
                    if (postSettingEntity.gender == GenderRestrictions.all &&
                        postSettingEntity.genderRatio)
                      Text(
                          "남자: ${postSettingEntity.numOfMan}명 / 여자: ${postSettingEntity.numOfWoman}명"),
                    if (postSettingEntity.manner == 0.0)
                      const Text("매너온도: 제한 없음"),
                    if (postSettingEntity.manner == 100.0)
                      const Text("매너온도: 완벽한 사람만"),
                    if (postSettingEntity.manner != 0.0 &&
                        postSettingEntity.manner != 100.0)
                      Text("매너온도: ${postSettingEntity.manner}도 이상"),
                    if (postSettingEntity.startSameTime)
                      const Text("동시 채팅 시작: 인원 수 만큼 모이면 동시에 채팅을 시작합니다."),
                    if (postSettingEntity.openParticipation)
                      const Text("오픈 채팅: 채팅방이 사라지지 않고 유지됩니다."),
                    if (postSettingEntity.startSameTime)
                      const Text("내 친구만 입장: 작성자의 친구만 입장할 수 있습니다."),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBrownColor,
                        minimumSize: const Size(100, 65),
                      ),
                      onPressed: () {
                        log("모집글 생성");
                      },
                      child: const Text(
                        '모집글 생성',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: mainSilverColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
