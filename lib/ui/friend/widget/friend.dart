import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_info.dart';

class Friend extends StatefulWidget {
  const Friend({
    super.key,
    required this.model,
  });

  final FriendDetailModel model;

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> with TickerProviderStateMixin {
  late SlidableController _slidableController;

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
          withSlide ? null : context.pop();

          log("친구 삭제 확인");
        },
        child: const Text(
          "삭제",
          style: TextStyle(
            color: mainSilverColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _editAction() {
    log("editAction");
  }

  @override
  void initState() {
    _slidableController = SlidableController(this);
    _slidableController.dismissGesture;
    super.initState();
  }

  @override
  void dispose() {
    _slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.key),
      closeOnScroll: false,
      groupTag: 'friend',
      controller: _slidableController,
      endActionPane: ActionPane(
        dragDismissible: false,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _editAction(),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            autoClose: true,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) => _deleteAction(true),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            autoClose: true,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: mainSilverColor,
        ),
        height: 75 * hu,
        child: Material(
          color: mainSilverColor,
          child: InkWell(
            onTap: () async {
              await context.push(
                "${CustomRouter.friendPath}/${CustomRouter.friendDetailPath}",
                extra: widget.model,
              );
            },
            onLongPress: () {
              showCustomDialog(
                context,
                Column(
                  children: [
                    UserProfile(
                      avatarId: widget.model.id,
                      randomAvatarSize: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.model.nickname,
                      style: const TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _renderOption(
                      color: Colors.green,
                      onTap: () {
                        log("친구 DM 보내기");
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      icon: Icons.messenger_outline,
                      optionTitle: "DM 보내기",
                    ),
                    const SizedBox(height: 10),
                    _renderOption(
                      color: Colors.redAccent,
                      onTap: () {
                        _deleteAction(false);
                      },
                      icon: Icons.delete_forever,
                      optionTitle: "친구 삭제",
                    ),
                    const SizedBox(height: 10),
                    _renderOption(
                      color: Colors.blueAccent,
                      onTap: () {
                        context.pop();
                        log("신고 하기");
                      },
                      icon: Icons.report_gmailerrorred_outlined,
                      optionTitle: "신고",
                    )
                  ],
                ),
                color: Colors.transparent,
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 70 * wu,
                  child: Hero(
                    tag: widget.model.id,
                    child: UserProfile(
                      randomAvatarSize: 45,
                      avatarId: widget.model.id,
                    ),
                  ),
                ),
                SizedBox(width: 10 * wu),
                FriendInfo(
                  friendName: widget.model.nickname,
                  stateMsg: widget.model.stateMsg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _renderOption({
  required Color color,
  required VoidCallback onTap,
  required IconData icon,
  required String optionTitle,
}) {
  return Material(
    color: color,
    borderRadius: BorderRadius.circular(8),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: mainSilverColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Icon(
              icon,
              color: mainSilverColor,
              size: 24 * hu,
            ),
          ],
        ),
      ),
    ),
  );
}
