import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/widget/custom_expansion_tile.dart';

class ExtraNoticeScreen extends StatelessWidget {
  const ExtraNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("공지사항")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
            CustomExpansionTile(
              title: "2024년 9월 17일 임시 점검 안내",
              subTitle: DateTime.now().toString().substring(0, 10),
              children: const [
                Text("2024년 9월 17일 임시 점검 안내"),
                SizedBox(height: 35),
                Text("다가오는 9월 17일 오후 3시부터 일시 저검이 있을 예정입니다."),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
