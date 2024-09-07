import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/data_source/latest_post_dummy.dart';
import 'package:sottie_flutter/data/post/data_source/recommend_post_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';
import 'package:sottie_flutter/ui/home/widget/event_page.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  late Future<List<PostModel>> latestPostModelList;
  late Future<List<PostModel>> recommendPostModelList;

  @override
  void initState() {
    super.initState();
    latestPostModelList = getLatestPostDummy();
    recommendPostModelList = getRecommendPostDummy();
  }

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
        _subTitle("# 최신 모집글"),
        FutureBuilder(
          future: latestPostModelList,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingSkeleton();
            } else if (!snapshot.hasData) {
              return Container();
            } else if (snapshot.hasData) {
              final data = snapshot.data;

              return Column(
                children: data!.map((data) {
                  return Post(model: data);
                }).toList(),
              );
            } else {
              return const Center(
                child: Text("데이터를 가져올 수 없습니다.",
                    style: TextStyle(color: Colors.black)),
              );
            }
          },
        ),
        _subTitle("# 추천 모집글"),
        FutureBuilder(
          future: recommendPostModelList,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingSkeleton();
            } else if (!snapshot.hasData) {
              return Container();
            } else if (snapshot.hasData) {
              final data = snapshot.data;

              return Column(
                children: data!.map((data) {
                  return Post(model: data);
                }).toList(),
              );
            } else {
              return const Center(
                child: Text("데이터를 가져올 수 없습니다.",
                    style: TextStyle(color: Colors.black)),
              );
            }
          },
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
