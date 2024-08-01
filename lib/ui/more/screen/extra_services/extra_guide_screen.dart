import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_tile.dart';

class ExtraGuideScreen extends StatefulWidget {
  const ExtraGuideScreen({super.key});

  @override
  State<ExtraGuideScreen> createState() => _ExtraGuideScreenState();
}

class _ExtraGuideScreenState extends State<ExtraGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("도움말"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ExtraServiceTile(
              title: "모집글 생성하기",
              children: [
                Text("홈 화면 상단의 플러스 버튼을 누른 후 생성하세요"),
                SizedBox(height: 20),
              ],
            ),
            ExtraServiceTile(
              title: "동시 채팅 시작이란?",
              children: [
                Text(
                    "채팅방을 만들자 마자 이용할 수 있는 것이 아닌 해당 인원 수 만큼 모이면 채팅방이 만들어지면서 채팅을 동시에 시작할 수 있습니다."),
                SizedBox(height: 20),
              ],
            ),
            ExtraServiceTile(
              title: "오픈 채팅이란?",
              children: [
                Text(
                    "채팅방은 약속된 날짜 및 시간으로부터 24시간 이후 사라집니다. 그러나 오픈채팅으로 설정된 채팅방은 시간이 지난 이후에도 사라지지 않고 계속 채팅을 이어갈 수 있습니다."),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
