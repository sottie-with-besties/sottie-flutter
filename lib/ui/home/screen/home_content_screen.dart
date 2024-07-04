import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sottie_flutter/data/category.dart';
import 'package:sottie_flutter/ui/common/widget/find_feed.dart';
import 'package:sottie_flutter/ui/home/widget/event_page.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const EventPage(),
        const SizedBox(
          height: 30,
        ),
        _subTitle("# 인기 TOP 5"),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        _subTitle("# 추천합니다"),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
        ),
        FindFeed(
          category: Category.study.name,
          currentMemberCount: 2,
          maxMemberCount: 5,
          title: "플러터 스터디 모집",
          date: "2024년 7월 3일",
          location: "수원시 성균관대역",
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

Widget _subTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}
