import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/more/controller/modify_image.dart';

class InfoModifyScreen extends StatefulWidget {
  const InfoModifyScreen({super.key});

  @override
  State<InfoModifyScreen> createState() => _InfoModifyScreenState();
}

class _InfoModifyScreenState extends State<InfoModifyScreen> {
  final _nicknameController = TextEditingController();
  final _stateMessageController = TextEditingController();
  final _nicknameFocusNode = FocusNode();
  final _stateMessageFocusNode = FocusNode();

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
  void initState() {
    super.initState();
    _nicknameController.text = myInfoEntity.nickName;
    _stateMessageController.text = myInfoEntity.stateMessage ?? '';
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _stateMessageController.dispose();
    _nicknameFocusNode.dispose();
    _stateMessageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myInfoEntity.nickName = _nicknameController.text;
        myInfoEntity.stateMessage = _stateMessageController.text;
        _nicknameFocusNode.unfocus();
        _stateMessageFocusNode.unfocus();
        // Todo: 디바운스 -> 서버로 수정한 정보 보내기
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () async {
                    await modifyImage(context);
                    setState(() {});
                    log(myInfoEntity.myProfilePath ?? 'null');
                    // Todo: 디바운스 -> 서버로 수정한 정보 보내기
                  },
                  child: Hero(
                    tag: 'me',
                    child: UserProfile(
                      avatarId: 'me',
                      randomAvatarSize: 80,
                      profileAvatarSize: 40,
                      profileUrl: myInfoEntity.profileUrl,
                      myProfileXFilePath: myInfoEntity.myProfilePath,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      myInfoEntity.profileUrl = null;
                      myInfoEntity.myProfilePath = null;
                      setState(() {});
                    },
                    child: const Text("프로필 사진 초기화")),
                const SizedBox(height: 30),
                _renderSubTitle("닉네임"),
                LocalTextField(
                  controller: _nicknameController,
                  focusNode: _nicknameFocusNode,
                  prefixIcon: false,
                  hint: myInfoEntity.nickName,
                  maxLength: 10,
                  onFieldSubmitted: (value) {
                    myInfoEntity.nickName = value;
                  },
                ),
                _renderSubTitle("상태 메세지"),
                LocalTextField(
                  controller: _stateMessageController,
                  focusNode: _stateMessageFocusNode,
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
                          context.push(
                              "${CustomRouter.morePath}/${CustomRouter.infoModifyPath}/${CustomRouter.emailChangePath}");
                        },
                        child: const Text("이메일 변경")),
                    TextButton(
                        onPressed: () {
                          context.push(
                              "${CustomRouter.authPath}/${CustomRouter.findPasswordPath}");
                        },
                        child: const Text("비밀번호 변경")),
                    TextButton(
                        onPressed: () {
                          context.push(
                            "${CustomRouter.authPath}/${CustomRouter.certificationPath}",
                            extra: {
                              'isModifyInfo': true,
                            },
                          );
                        },
                        child: const Text("개인정보 변경 (이름, 성별, 전화번호 등)")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
