import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';

class VerificationCompleteScreen extends StatelessWidget {
  const VerificationCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "환영합니다!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(height: 20),
              const Text("이메일: kjp00552277@gmail.com"),
              const SizedBox(height: 20),
              const Text("패스워드: 12345667!"),
              const SizedBox(height: 20),
              const Text("이름: 김진표"),
              const SizedBox(height: 20),
              const Text("핸드폰 번호: 01012345678"),
              const SizedBox(height: 20),
              const Text("성별: 남성"),
              const SizedBox(height: 20),
              const Text("생일: 2000-05-27"),
              const SizedBox(height: 20),
              const Text("닉네임: system"),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          context.go(CustomRouter.authPath);
                        },
                        child: const Text(
                          "로그인 화면으로",
                          style: TextStyle(
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
