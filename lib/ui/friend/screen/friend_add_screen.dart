import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/user/data_source/user_search_dummy.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';

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
  bool userSearching = false;
  UserModel? userFound;
  String userSearchText = '';

  final _textController = TextEditingController();

  Future<void> _searchUser(String searchString) async {
    userSearching = true;
    setState(() {});
    userFound = await getUserSearchDummy();
    userFound == null ? userSearchText = '유저가 존재하지 않습니다.' : null;
    userSearching = false;
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * wu),
      child: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20 * hu),
              child: Center(
                child: userSearching
                    ? const CircularProgressIndicator(color: mainBlackColor)
                    : userFound != null
                        ? SottieUser(
                            model: userFound!,
                            isMyFriend: false,
                          )
                        : Text(userSearchText),
              ),
            ),
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
