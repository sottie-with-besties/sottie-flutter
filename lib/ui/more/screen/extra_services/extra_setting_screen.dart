import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';

class ExtraSettingScreen extends StatelessWidget {
  const ExtraSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("환경설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _SettingSwitch(
                title: "이벤트 수신",
                explanation: "이벤트 발생에 대하여 사용자에게 알립니다.",
              ),
              const _SettingSwitch(
                title: "채팅 생성 알림",
                explanation: "동시 채팅 시작이 설정되어 있는 채팅방의 인원이 모두 모일 경우 사용자에게 알립니다.",
              ),
              const _SettingSwitch(
                title: "채팅 알림",
                explanation: "채팅방에서 채팅이 발생하면 사용자에게 알립니다.",
              ),
              const _SettingSwitch(
                title: "DM 알림",
                explanation: "친구가 나에게 DM을 보내면 사용자에게 알립니다.",
              ),
              const _SettingSwitch(
                title: "친구 추가 거부",
                explanation: "다른 유저가 나를 친구 추가 할 수 없습니다.",
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      // Todo: 로그아웃 후 Auth 화면 돌아가기
                      // await signOut();
                      context.go(CustomRouter.authPath);
                    },
                    child: const Text("로그아웃"),
                  ),
                  const SizedBox(width: 30),
                  OutlinedButton(
                    onPressed: () {
                      // Todo: 회원탈퇴하는 스크린 만들기(본인 인증 후 탈퇴)
                      log("회원 탈퇴");
                    },
                    child: const Text("회원탈퇴"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingSwitch extends StatefulWidget {
  const _SettingSwitch({
    required this.title,
    this.explanation,
  });

  final String title;
  final String? explanation;

  @override
  State<_SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<_SettingSwitch> {
  bool settingValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: settingValue,
                activeColor: mainBrownColor,
                onChanged: (val) {
                  settingValue = val;
                  setState(() {});

                  // Todo: 알림 변경에 대해 서버에 알리기
                },
              ),
            ],
          ),
          if (widget.explanation != null) Text(widget.explanation!)
        ],
      ),
    );
  }
}
