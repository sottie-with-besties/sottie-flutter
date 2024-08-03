import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/post/controller/image_selection.dart';

class MakePostScreenStepOne extends StatefulWidget {
  const MakePostScreenStepOne({super.key});

  @override
  State<MakePostScreenStepOne> createState() => _MakePostScreenStepOneState();
}

class _MakePostScreenStepOneState extends State<MakePostScreenStepOne> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode contentFocusNode = FocusNode();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        titleFocusNode.unfocus();
        contentFocusNode.unfocus();
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
                controller: titleController,
                focusNode: titleFocusNode,
              ),
              LocalTextField(
                prefixIcon: false,
                hint: "내용을 입력하세요.",
                lines: 12,
                controller: contentController,
                focusNode: contentFocusNode,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: ElevatedButton(
                    onPressed: () async {
                      await imageSelection(context);
                    },
                    child: const Text(
                      "이미지 선택",
                      style: TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text == '' ||
                          contentController.text == '') {
                        showCustomDialog(
                          context,
                          const Text("제목 및 내용을 한 글자 이상 입력해주세요."),
                        );
                      } else {
                        postSettingEntity.title = titleController.text;
                        postSettingEntity.content = contentController.text;
                        context.push(
                            '${CustomRouter.makePostStepOnePath}/${CustomRouter.makePostStepTwoPath}');
                      }
                    },
                    child: const Text(
                      "다음 1/3",
                      style: TextStyle(
                        color: mainSilverColor,
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
