import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail/gender_restrictions.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
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

  // 더미
  final thumbnail = List.generate(
      5,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Center(
                child: Text(
              "Thumbnail $index",
              style: const TextStyle(color: Colors.black),
            )),
          ));

  @override
  void initState() {
    if (makePostDetailEntity.images != null) {
      images = makePostDetailEntity.images!.map((image) {
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
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                makePostDetailEntity.title,
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
                makePostDetailEntity.content,
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
                        "카테고리: ${makePostDetailEntity.convertCategoryToStringList().reduce((p, n) => "$n , $p")}"),
                    Text(
                        "참여 인원: ${makePostDetailEntity.numOfMember == 0 ? "제한 없음" : makePostDetailEntity.numOfMember}"),
                    Text(
                        "날짜: ${makePostDetailEntity.date == null ? "날짜 정보 없음" : makePostDetailEntity.date!.toString().substring(0, 16)}"),
                    Text("장소: ${makePostDetailEntity.location.name}"),
                    Text(
                        "나이: ${makePostDetailEntity.convertAgeRangeToStringList().reduce((p, n) => "$n , $p")}"),
                    Text("성별제한: ${makePostDetailEntity.gender.name}"),
                    if (makePostDetailEntity.gender == GenderRestrictions.all)
                      Text(
                          "성비제한: ${makePostDetailEntity.genderRatio ? "있음" : "없음"}"),
                    if (makePostDetailEntity.gender == GenderRestrictions.all &&
                        makePostDetailEntity.genderRatio)
                      Text(
                          "남자: ${makePostDetailEntity.numOfMan}명 / 여자: ${makePostDetailEntity.numOfWoman}명"),
                    if (makePostDetailEntity.manner == 0.0)
                      const Text("매너온도: 제한 없음"),
                    if (makePostDetailEntity.manner == 100.0)
                      const Text("매너온도: 완벽한 사람만"),
                    if (makePostDetailEntity.manner != 0.0 &&
                        makePostDetailEntity.manner != 100.0)
                      Text("매너온도: ${makePostDetailEntity.manner}도 이상"),
                    if (makePostDetailEntity.startSameTime)
                      const Text("동시 채팅 시작: 인원 수 만큼 모이면 동시에 채팅을 시작합니다."),
                    if (makePostDetailEntity.openParticipation)
                      const Text("오픈 채팅: 채팅방이 사라지지 않고 유지됩니다."),
                    if (makePostDetailEntity.startSameTime)
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
