import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';
import 'package:sottie_flutter/use_case/friend/friend_use_case.dart';
import 'package:sottie_flutter/use_case/user/user_use_case.dart';

class FriendAddScreen extends StatefulWidget {
  const FriendAddScreen({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  State<FriendAddScreen> createState() => _FriendAddScreenState();
}

class _FriendAddScreenState extends State<FriendAddScreen> {
  bool userSearching = false;
  List<UserModel> searchResults = [];
  String userSearchText = '';

  final _textController = TextEditingController();

  Future<void> _searchUser(String searchString) async {
    userSearching = true;
    setState(() {});
    searchResults = await UserUseCase.searchUser(userSearchText);
    searchResults.isEmpty ? userSearchText = '유저가 존재하지 않습니다.' : null;
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
      padding: EdgeInsets.symmetric(horizontal: 16 * ScreenSize.wu),
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
            SizedBox(height: 10 * ScreenSize.hu),
            LocalTextField(
              hint: "전화번호를 입력하세요",
              focusNode: widget.focusNode,
              controller: _textController,
              keyboardType: TextInputType.text,
              onFieldSubmitted: _searchUser,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20 * ScreenSize.hu),
              child: Center(
                child:
                    userSearching
                        ? const CircularProgressIndicator(
                          color: AppColors.blackColor,
                        )
                        : searchResults.isNotEmpty
                        ? SizedBox(
                          height: 150 * ScreenSize.hu,
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10 * ScreenSize.hu,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SottieUser(
                                      model: searchResults[index],
                                      heroTag: 'friendAddSearch_$index',
                                      isMyFriend: false,
                                      textWidth: 100,
                                    ),
                                    _renderFriendManageButton(
                                      AppColors.blueColor,
                                      FontAwesomeIcons.userPlus,
                                      () {
                                        FriendUseCase.acceptFriendRequest(
                                          searchResults[index].id.toString(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                        : Text(userSearchText),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderSubTitle("친구 요청"),
                SizedBox(height: 10 * ScreenSize.hu),
                Center(
                  child: CustomFutureBuilder(
                    futureFunction: FriendUseCase.getFriendRequestsList,
                    loadingWidget: const CircularProgressIndicator(
                      color: AppColors.blackColor,
                    ),
                    callBack: (futureData) {
                      final friendRequestList = futureData as List<UserModel>;

                      return SizedBox(
                        height: 250 * ScreenSize.hu,
                        child: ListView.builder(
                          itemCount: friendRequestList.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10 * ScreenSize.hu,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SottieUser(
                                    model: futureData[index],
                                    heroTag: 'friendAddRequest',
                                    isMyFriend: false,
                                    textWidth: 100,
                                  ),
                                  Row(
                                    children: [
                                      _renderFriendManageButton(
                                        AppColors.redColor,
                                        FontAwesomeIcons.xmark,
                                        () {
                                          log("friend request refuse");
                                        },
                                      ),
                                      SizedBox(width: 10 * ScreenSize.wu),
                                      _renderFriendManageButton(
                                        AppColors.blueColor,
                                        FontAwesomeIcons.userPlus,
                                        () {
                                          FriendUseCase.acceptFriendRequest(
                                            futureData[index].id.toString(),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Text _renderSubTitle(String title) =>
    Text(title, style: const TextStyle(fontWeight: FontWeight.bold));

InkWell _renderFriendManageButton(
  Color color,
  IconData iconData,
  VoidCallback callback,
) {
  return InkWell(
    onTap: callback,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      padding: const EdgeInsets.all(8),
      width: 40 * ScreenSize.wu,
      height: 30 * ScreenSize.wu,
      child: FittedBox(
        child: Icon(iconData, color: AppColors.whiteSilverColor),
      ),
    ),
  );
}
