import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class MakePostScreenStepOne extends StatefulWidget {
  const MakePostScreenStepOne({super.key});

  @override
  State<MakePostScreenStepOne> createState() => _MakePostScreenStepOneState();
}

class _MakePostScreenStepOneState extends State<MakePostScreenStepOne> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _contentFocusNode = FocusNode();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleFocusNode.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _contentFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("모집글 작성"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              LocalTextField(
                hint: "제목",
                prefixIcon: false,
                enabledBorder: false,
                focusBorder: false,
                controller: _titleController,
                focusNode: _titleFocusNode,
                maxLength: 15,
              ),
              const SizedBox(height: 15),
              LocalTextField(
                prefixIcon: false,
                enabledBorder: false,
                focusBorder: false,
                hint: "내용을 입력하세요.",
                lines: 12,
                controller: _contentController,
                focusNode: _contentFocusNode,
                maxLength: 100,
              ),
              const SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_titleController.text == '' ||
                          _contentController.text == '') {
                        showCustomDialog(
                          context,
                          const Text("제목 및 내용을 한 글자 이상 입력해주세요."),
                        );
                      } else {
                        postSettingEntity.title = _titleController.text;
                        postSettingEntity.content = _contentController.text;
                        context.push(
                            '${CustomRouter.makePostStepOnePath}/${CustomRouter.makePostStepTwoPath}');
                      }
                    },
                    child: const Text(
                      "다음 1/3",
                      style: TextStyle(
                        color: mainWhiteSilverColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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
