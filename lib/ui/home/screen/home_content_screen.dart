import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/data_source/friend_post_dummy.dart';
import 'package:sottie_flutter/data/post/data_source/latest_post_dummy.dart';
import 'package:sottie_flutter/data/post/data_source/recommend_post_dummy.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/home/widget/event_page.dart';
import 'package:sottie_flutter/ui/post/widget/post.dart';

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
        _subTitle("# 친구 모집글"),
        CustomFutureBuilder(
          futureFunction: getFriendPostDummy,
          callBack: (futureData) => Column(
            children: futureData!
                .map<Widget>((data) => Post(
                      model: data,
                      isWaiting: false,
                    ))
                .toList(),
          ),
        ),
        _subTitle("# 최신 모집글"),
        CustomFutureBuilder(
          futureFunction: getLatestPostDummy,
          callBack: (futureData) => Column(
            children: futureData!
                .map<Widget>((data) => Post(
                      model: data,
                      isWaiting: false,
                    ))
                .toList(),
          ),
        ),
        _subTitle("# 추천 모집글"),
        CustomFutureBuilder(
          futureFunction: getRecommendPostDummy,
          callBack: (futureData) => Column(
            children: futureData!
                .map<Widget>((data) => Post(
                      model: data,
                      isWaiting: false,
                    ))
                .toList(),
          ),
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
