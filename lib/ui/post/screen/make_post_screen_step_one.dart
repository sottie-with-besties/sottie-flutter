import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

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
          backgroundColor: Colors.white,
          title: const Text(
            "모집글 작성",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  makePostDetailEntity.title = titleController.text;
                  makePostDetailEntity.content = contentController.text;
                  log(makePostDetailEntity.title, name: "제목");
                  log(makePostDetailEntity.content, name: "내용");
                  context.push(
                      '${CustomRouter.makePostStepOnePath}/${CustomRouter.makePostStepTwoPath}');
                },
                child: const Text(
                  "다음 1/3",
                  style: TextStyle(
                    color: mainSilverColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
