import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class FindDetailScreen extends StatefulWidget {
  const FindDetailScreen({super.key});

  @override
  State<FindDetailScreen> createState() => _FindDetailScreenState();
}

class _FindDetailScreenState extends State<FindDetailScreen> {
  final controller = PageController();

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
              const Text(
                "플러터 스터디 모집",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: controller,
                      itemBuilder: (_, index) {
                        return thumbnail[index % thumbnail.length];
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SmoothPageIndicator(
                    controller: controller,
                    count: thumbnail.length,
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
              const Text(
                "앱 개발 최고의 프레임워크, 플러터를 공부하실 분들을 모집합니다! 저희는 매우 편안하고 친절한 분위기를 유지하고 목표달성을 위해 열심히 정진합니다!",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("참여 인원: 2/5"),
                    Text("날짜: 2024년 7월 7일 오후 2:00"),
                    Text("장소: 수원시 성균관대역"),
                    Text("나이: 성인"),
                    Text("매너온도: 36.5도 이상"),
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
                      onPressed: () {},
                      child: const Text(
                        "참여하기",
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
