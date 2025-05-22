import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_review_screen.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_drawer.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_events_layout.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_type_box.dart';

class InChatScreen extends StatefulWidget {
  const InChatScreen({
    super.key,
    this.chatRoomModel,
    this.dmModel,
    required this.isChattingOver,
  });

  final ChatRoomModel? chatRoomModel;
  final DmModel? dmModel;
  final bool isChattingOver;

  @override
  State<InChatScreen> createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDm = widget.chatRoomModel == null;

    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isDm
                ? widget.dmModel!.userModel.nickname
                : widget.chatRoomModel!.title,
            style: const TextStyle(color: AppColors.whiteSilverColor),
          ),
          backgroundColor: AppColors.blueColor,
          iconTheme: const IconThemeData(color: AppColors.whiteSilverColor),
        ),
        backgroundColor: AppColors.whiteSilverColor,
        endDrawer:
            isDm ? null : InChatDrawer(chatRoomModel: widget.chatRoomModel!),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InChatEventsLayout(
              isChattingOver: widget.isChattingOver,
              date: widget.chatRoomModel?.gatheringDate ?? DateTime(2000),
            ),
            if (!widget.isChattingOver) InChatTypeBox(focusNode: _focusNode),
            if (widget.isChattingOver)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      ModalController.showCustomModalBottomSheet(
                        context,
                        const InChatReviewScreen(),
                      );
                    },
                    child: const Text("리뷰하세요!"),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
