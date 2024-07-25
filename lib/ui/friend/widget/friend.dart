import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_info.dart';
import 'package:sottie_flutter/ui/friend/widget/profile.dart';

class Friend extends StatefulWidget {
  const Friend({
    super.key,
    required this.friendInfo,
  });

  final Map<String, dynamic> friendInfo;

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> with TickerProviderStateMixin {
  late SlidableController slidableController;

  void deleteAction(BuildContext context, Map<String, dynamic> data) {
    log("deleteAction ::: context : $context data : $data");
    log("deleteAction ::: context : $context slidableController: $slidableController");
  }

  void editAction(BuildContext context, Map<String, dynamic> data) {
    log("editAction ::: context : $context data : $data");
  }

  @override
  void initState() {
    slidableController = SlidableController(this);
    slidableController.dismissGesture;
    super.initState();
  }

  @override
  void dispose() {
    slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.friendInfo['id'] ?? '';
    final friendName = widget.friendInfo['friendName'] ?? '';
    final stateMsg = widget.friendInfo['stateMsg'] ?? '';

    return Slidable(
      key: ValueKey(this.widget.key),
      closeOnScroll: false,
      groupTag: 'friend',
      controller: slidableController,
      endActionPane: ActionPane(
        dragDismissible: false,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => editAction(context, widget.friendInfo),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            autoClose: true,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) => deleteAction(context, widget.friendInfo),
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
        child: Row(
          children: [
            const FriendProfile(),
            SizedBox(width: 10 * wu),
            FriendInfo(
              friendName: friendName,
              stateMsg: stateMsg,
            ),
          ],
        ),
      ),
    );
  }
}
