import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class FriendAddScreen extends StatefulWidget {
  const FriendAddScreen({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  State<FriendAddScreen> createState() => _FriendAddScreenState();
}

class _FriendAddScreenState extends State<FriendAddScreen> {
  final _textController = TextEditingController();

  void _searchUser(String searchString) {
    log(searchString);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _renderSubTitle("유저 검색"),
                    OutlinedButton(
                      onPressed: () {
                        widget.focusNode.unfocus();
                        _searchUser(_textController.text);
                      },
                      child: const Text('검색'),
                    ),
                  ],
                ),
                SizedBox(height: 10 * hu),
                LocalTextField(
                  hint: "전화번호를 입력하세요",
                  focusNode: widget.focusNode,
                  controller: _textController,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: _searchUser,
                ),
              ],
            ),
            SizedBox(height: 100 * hu),
            Column(
              children: [
                _renderSubTitle("친구 요청"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Text _renderSubTitle(String title) => Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
