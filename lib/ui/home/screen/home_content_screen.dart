import 'package:flutter/material.dart';
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
        EventPage(),
        const SizedBox(
          height: 30,
        ),
        FindFeed(),
      ],
    );
  }
}
