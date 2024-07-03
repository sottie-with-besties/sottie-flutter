import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/category.dart';
import 'package:sottie_flutter/ui/common/widget/find_feed.dart';
import 'package:sottie_flutter/ui/home/widget/event_page.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const EventPage(),
        const SizedBox(
          height: 30,
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
      ],
    );
  }
}
