import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_tile.dart';

class ExtraCustomerServiceScreen extends StatelessWidget {
  const ExtraCustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("고객센터"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "자주 묻는 질문",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const ExtraServiceTile(
            title: "상대방을 친구 추가 하고 싶어요.",
            children: [
              Text("채팅방 내 목록에서 상대방을 터치한 후 친구 추가 버튼을 누르세요."),
              SizedBox(height: 20),
            ],
          ),
          const ExtraServiceTile(
            title: "프로필 사진은 어떻게 바꾸나요?",
            children: [
              Text("Friends 탭 또는 More 탭에서 자신의 프로필을 탭하거나 수정 버튼을 눌러 바꾸실 수 있습니다."),
              SizedBox(height: 20),
            ],
          ),
          const ExtraServiceTile(
            title: "채팅방 생성은 어디에서 하나요?",
            children: [
              Text("화면 상단 플러스 버튼을 눌러서 생성하실 수 있습니다."),
              SizedBox(height: 20),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () async {
                  await context.push(
                      '${CustomRouter.morePath}/${CustomRouter.customerServicePath}/${CustomRouter.contactPath}');
                },
                child: const Text("문의하기"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
