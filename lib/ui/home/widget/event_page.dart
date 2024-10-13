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
  final _controller = PageController();

  void _autoPageChange() {
    // 디바운스를 거는 이유
    // => 페이지가 자동으로 넘어가는 도중 유저가 페이지를 직접 손으로 밀어 넘길 경우
    // 함수가 반복 호출 되는 것을 방지하기 위해서
    EasyDebounce.debounce("autoPageChange", const Duration(seconds: 5), () {
      // PageController가 현재 PageView와 연결되어 있는지 확인 -> 에러 방지
      if (_controller.hasClients) {
        _controller.nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
      } else {
        // PageController가 아직 사용 가능한 상태가 아닐 때 대처할 로직을 추가할 수 있습니다.
      }
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
    _autoPageChange();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: _controller,
            itemBuilder: (_, index) {
              return events[index % events.length];
            },
            onPageChanged: (_) => _autoPageChange(),
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _controller,
          count: events.length,
          effect: const WormEffect(
            dotHeight: 16,
            dotWidth: 16,
            activeDotColor: mainBlueColor,
          ),
        ),
      ],
    );
  }
}
