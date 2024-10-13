import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/on_long_press_option.dart';
import 'package:sottie_flutter/ui/common/widget/slide_tap_widget.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_info.dart';

class Friend extends StatefulWidget {
  const Friend({
    super.key,
    required this.model,
  });

  final FriendModel model;

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  void _dmAction(bool withSlide) {
    log("DmAction");
  }

  void _deleteAction(bool withSlide) {
    showCustomDialog(
      context,
      Center(
        child: Text(
          "${widget.model.nickname}를 삭제하시겠습니까?",
          style: const TextStyle(
            fontSize: 20,
          ),
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

          log("친구 삭제 확인");
        },
        child: const Text(
          "삭제",
          style: TextStyle(
            color: mainWhiteSilverColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _reportAction(bool withSlide) {
    log("ReportAction");
  }

  @override
  Widget build(BuildContext context) {
    return SlideTapWidget(
      onTap: () async {
        await context.push(
          "${CustomRouter.friendPath}/${CustomRouter.friendDetailPath}",
          extra: {
            'model': widget.model,
            'isMyFriend': true,
          },
        );
      },
      onLongPressWidget: Column(
        children: [
          UserProfile(
            profileUrl: widget.model.id,
            randomAvatarSize: 100,
          ),
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
              _dmAction(false);
            },
            icon: Icons.messenger_outline,
            optionTitle: "DM 보내기",
          ),
          SizedBox(height: 10 * hu),
          OnLongPressOption(
            color: Colors.redAccent,
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
              _reportAction(false);
            },
            icon: Icons.report_gmailerrorred_outlined,
            optionTitle: "신고",
          )
        ],
      ),
      slideActions: [
        SlidableAction(
          onPressed: (context) => _dmAction(true),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.messenger_outline,
          label: 'DM',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _deleteAction(true),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.delete,
          label: 'Delete',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        SlidableAction(
          onPressed: (context) => _reportAction(true),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          autoClose: true,
          icon: Icons.report,
          label: 'Report',
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ],
      groupTag: 'friend',
      child: Row(
        children: [
          SizedBox(
            width: 70 * wu,
            child: Hero(
              tag: widget.model.id,
              child: UserProfile(
                profileUrl: widget.model.id,
                randomAvatarSize: 45,
              ),
            ),
          ),
          SizedBox(width: 10 * wu),
          FriendInfo(
            friendName: widget.model.nickname,
            stateMsg: widget.model.stateMsg ?? '',
          ),
        ],
      ),
    );
  }
}
