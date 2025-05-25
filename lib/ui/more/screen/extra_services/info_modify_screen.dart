import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/more/controller/modify_image.dart';
import 'package:sottie_flutter/ui/user/controller/my_info_controller.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

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
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  @override
  void initState() {
    super.initState();
    _nicknameController.text = MyInfoController.myInfoModel.nickName;
    _stateMessageController.text = MyInfoController.myInfoModel.stateMessage;
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
        MyInfoController.myInfoModel.nickName = _nicknameController.text;
        MyInfoController.myInfoModel.stateMessage =
            _stateMessageController.text;
        _nicknameFocusNode.unfocus();
        _stateMessageFocusNode.unfocus();
        // Todo: 디바운스 -> 서버로 수정한 정보 보내기
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await modifyImage(context);
                    setState(() {});
                    // Todo: 디바운스 -> 서버로 수정한 정보 보내기
                  },
                  child: Center(
                    child: Hero(
                      tag: '${MyInfoController.myInfoModel.id}/me',
                      child: UserProfile(
                        profileUrl: MyInfoController.myInfoModel.profileUrl,
                        profileSize: 50,
                        myProfileXFilePath:
                            MyInfoController.myInfoModel.myProfilePath,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      MyInfoController.myInfoModel.profileUrl = null;
                      MyInfoController.myInfoModel.myProfilePath = null;
                      setState(() {});
                    },
                    child: const Text("프로필 사진 초기화"),
                  ),
                ),
                SizedBox(height: 5 * ScreenSize.hu),
                Center(
                  child: Text(
                    "${MyInfoController.myInfoModel.birthYear}  |  ${MyInfoController.myInfoModel.gender == "MAIL" ? "남성" : "여성"}  |  ${MyInfoController.myInfoModel.name}",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20 * ScreenSize.hu),
                _renderSubTitle("닉네임"),
                SizedBox(height: 5 * ScreenSize.hu),
                LocalTextField(
                  controller: _nicknameController,
                  focusNode: _nicknameFocusNode,
                  prefixIcon: false,
                  hint: MyInfoController.myInfoModel.nickName,
                  maxLength: 10,
                  onFieldSubmitted: (value) {
                    MyInfoController.myInfoModel.nickName = value;
                  },
                ),
                _renderSubTitle("상태 메세지"),
                SizedBox(height: 5 * ScreenSize.hu),
                LocalTextField(
                  controller: _stateMessageController,
                  focusNode: _stateMessageFocusNode,
                  prefixIcon: false,
                  hint: MyInfoController.myInfoModel.stateMessage,
                  maxLength: 30,
                  onFieldSubmitted: (value) {
                    MyInfoController.myInfoModel.stateMessage = value;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.push(
                          "${CustomRouter.morePath}/${CustomRouter.infoModifyPath}/${CustomRouter.emailChangePath}",
                        );
                      },
                      child: const Text("이메일 변경"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(
                          "${CustomRouter.authPath}/${CustomRouter.findPasswordPath}",
                        );
                      },
                      child: const Text("비밀번호 변경"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(
                          "${CustomRouter.authPath}/${CustomRouter.certificationPath}",
                          extra: {'isModifyInfo': true},
                        );
                      },
                      child: const Text("개인정보 변경 (이름, 성별, 전화번호 등)"),
                    ),
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
