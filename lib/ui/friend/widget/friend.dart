import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_sub_info.dart';
import 'package:sottie_flutter/ui/chat/widget/profiles.dart';
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

class _FriendState extends State<Friend> with TickerProviderStateMixin{
  late Map<String, dynamic> friendInfo;
  late SlidableController slidableController = SlidableController(this);

  void deleteAction(BuildContext context, Map<String, dynamic> data) {
    print("deleteAction ::: context : $context data : $data");
    print("deleteAction ::: context : $context slidableController: $slidableController");
  }

  void editAction(BuildContext context, Map<String, dynamic> data) {
    print("editAction ::: context : $context data : $data");
  }

  @override
  void initState() {
    friendInfo = widget.friendInfo;
    slidableController.dismissGesture;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final id = friendInfo['id'];
    final friendName = friendInfo['friendName'];
    final stateMsg = friendInfo['stateMsg'];

    final profileSize = 60.r;
    return Slidable(
      key: ValueKey(id),
      closeOnScroll: false,
      groupTag: 'friend',
      controller: slidableController,
      endActionPane: ActionPane(
        dragDismissible: false,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => editAction(context, friendInfo),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            autoClose: true,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) => deleteAction(context, friendInfo),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            autoClose: true,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: mainSilverColor,
            ),
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FriendProfile(
                  profileCount: 1,
                  profileSize: profileSize,
                ),
                FriendInfo(
                  friendName: friendName,
                  stateMsg: stateMsg,
                ),
                const SizedBox(width: 50),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      )
    );
  }
}

