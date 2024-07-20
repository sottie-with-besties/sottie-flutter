import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail/category_sottie.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/home/widget/event_page.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = PostModel(
      id: '123123',
      detailId: '3452623456',
      category: CategorySottie.study.name,
      currentMemberCount: 2,
      maxMemberCount: 5,
      title: "플러터 스터디 모집",
      location: "수원시 성균관대역",
      date: "2024년 7월 3일",
    );
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
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        _subTitle("# 추천합니다"),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
        ),
        Post(
          model: model,
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
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
