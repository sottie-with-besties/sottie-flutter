import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class InfoModifyScreen extends StatefulWidget {
  const InfoModifyScreen({super.key});

  @override
  State<InfoModifyScreen> createState() => _InfoModifyScreenState();
}

class _InfoModifyScreenState extends State<InfoModifyScreen> {
  Text _renderSubTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  // Todo: 이미지 선택 기능
                },
                child: RandomAvatar(
                  DateTime.now().toIso8601String(),
                  width: 80 * hu,
                  height: 80 * hu,
                ),
              ),
              TextButton(
                  onPressed: () {
                    // Todo: 이미지 초기화 하는 코드
                  },
                  child: const Text("프로필 사진 초기화")),
              const SizedBox(height: 30),
              _renderSubTitle("닉네임"),
              LocalTextField(
                prefixIcon: false,
                hint: "닉네임",
                maxLength: 10,
                onFieldSubmitted: (value) {
                  log(value);
                },
              ),
              _renderSubTitle("상태 메세지"),
              LocalTextField(
                prefixIcon: false,
                hint: "상태 메세지",
                maxLength: 80,
                lines: 5,
                onFieldSubmitted: (value) {
                  log(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
