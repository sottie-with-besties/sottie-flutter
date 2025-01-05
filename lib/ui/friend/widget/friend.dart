import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/provider/friend/friend_manage.dart';
import 'package:sottie_flutter/provider/user/user_manage.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_long_press_widget.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';

class Friend extends StatefulWidget {
  const Friend({
    super.key,
    required this.model,
  });

  final UserModel model;

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  void _deleteAction(bool withSlide) {
    showCustomDialog(
      context,
      Center(
        child: Text(
          "${widget.model.nickname}를 삭제하시겠습니까?",
          style: const TextStyle(fontSize: 20),
        ),
      ),
      extraButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 50),
        ),
        onPressed: () {
          // 꾹 누른건 팝 두번, 슬라이드는 한번만
          Navigator.of(context, rootNavigator: true).pop();
          withSlide ? null : Navigator.of(context, rootNavigator: true).pop();

          friendDelete(context);
        },
        child: const Text("삭제"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideLongPressWidget(
      groupTag: 'friend',
      onLongPressWidget: Column(
        children: [
          UserProfile(profileUrl: widget.model.profileUrl),
          SizedBox(height: 10 * hu),
          Text(
            widget.model.nickname,
            style: const TextStyle(
              color: mainWhiteSilverColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: Colors.green,
            onTap: () {
              friendSendDm(context);
            },
            icon: Icons.messenger_outline,
            optionTitle: "DM 보내기",
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: mainRedColor,
            onTap: () {
              _deleteAction(false);
            },
            icon: Icons.delete_forever,
            optionTitle: "친구 삭제",
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: Colors.blueAccent,
            onTap: () {
              userReport(context);
            },
            icon: Icons.report_gmailerrorred_outlined,
            optionTitle: "신고",
          )
        ],
      ),
      slideActions: [
        SlidableAction(
          onPressed: (context) => friendSendDm(context),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.messenger_outline,
          label: 'DM',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _deleteAction(true),
          backgroundColor: mainRedColor,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.delete,
          label: 'Delete',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => userReport(context),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.report,
          label: 'Report',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10 * hu, horizontal: 16 * wu),
        child: SottieUser(
          model: widget.model,
          heroTag: 'friend',
          isMyFriend: true,
        ),
      ),
    );
  }
}
