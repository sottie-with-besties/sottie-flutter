import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final controller = PageController();

  void autoPageChange() {
    // 디바운스를 거는 이유
    // => 페이지가 자동으로 넘어가는 도중 유저가 페이지를 직접 손으로 밀어 넘길 경우
    // 함수가 반복 호출 되는 것을 방지하기 위해서
    EasyDebounce.debounce("autoPageChange", const Duration(seconds: 5), () {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    });
  }

  // 더미
  final events = List.generate(
      6,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: SizedBox(
              height: 280,
              child: Center(
                  child: Text(
                "Event $index",
                style: const TextStyle(color: Colors.black),
              )),
            ),
          ));

  @override
  void initState() {
    super.initState();
    autoPageChange();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (_, index) {
              return events[index % events.length];
            },
            onPageChanged: (_) => autoPageChange(),
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: controller,
          count: events.length,
          effect: const WormEffect(
            dotHeight: 16,
            dotWidth: 16,
            activeDotColor: mainBrownColor,
          ),
        ),
      ],
    );
  }
}
