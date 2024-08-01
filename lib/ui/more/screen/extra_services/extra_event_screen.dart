import 'dart:developer';

import 'package:flutter/material.dart';

class ExtraEventScreen extends StatelessWidget {
  const ExtraEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이벤트"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _EventFeed(title: "이벤트1", subTitle: "2024-08-01 ~ 2024-09-01"),
            _EventFeed(title: "이벤트2", subTitle: "2024-08-01 ~ 2024-09-01"),
            _EventFeed(title: "이벤트3", subTitle: "2024-08-01 ~ 2024-09-01"),
          ],
        ),
      ),
    );
  }
}

class _EventFeed extends StatelessWidget {
  const _EventFeed({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("이벤트");
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 100,
              child: const Center(
                child: Text(
                  "이벤트 이미지",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
