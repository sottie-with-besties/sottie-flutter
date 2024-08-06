import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
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
                onTap: () async {
                  final tempImg = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (tempImg == null) return;
                  myInfoEntity.profile = tempImg;
                  setState(() {});
                },
                child: myInfoEntity.profile == null
                    ? RandomAvatar(
                        DateTime.now().toIso8601String(),
                        width: 80 * hu,
                        height: 80 * hu,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            FileImage(File(myInfoEntity.profile!.path)),
                        radius: 40 * hu,
                      ),
              ),
              TextButton(
                  onPressed: () {
                    myInfoEntity.profile = null;
                    setState(() {});
                  },
                  child: const Text("프로필 사진 초기화")),
              const SizedBox(height: 30),
              _renderSubTitle("닉네임"),
              LocalTextField(
                prefixIcon: false,
                hint: myInfoEntity.nickName,
                maxLength: 10,
                onFieldSubmitted: (value) {
                  myInfoEntity.nickName = value;
                },
              ),
              _renderSubTitle("상태 메세지"),
              LocalTextField(
                prefixIcon: false,
                hint: myInfoEntity.stateMessage,
                maxLength: 30,
                onFieldSubmitted: (value) {
                  myInfoEntity.stateMessage = value;
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        log("이메일 변경");
                      },
                      child: const Text("이메일 변경")),
                  TextButton(
                      onPressed: () {
                        log("비밀번호 변경");
                      },
                      child: const Text("비밀번호 변경")),
                  TextButton(
                      onPressed: () {
                        log("개인정보 변경");
                      },
                      child: const Text("개인정보 변경 (이름, 성별, 전화번호 등)")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
