import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_info.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_profiles.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_top.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ChatRoomGenerated extends StatelessWidget {
  const ChatRoomGenerated({
    super.key,
    required this.model,
  });

  final ChatRoomModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainSilverColor,
      child: InkWell(
        onTap: () {
          context.push(
            '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
            extra: {
              'id': model.id,
              'title': model.chatTitle,
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 130 * hu,
          child: Column(
            children: [
              ChatRoomTop(model: model),
              SizedBox(height: 10 * hu),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChatRoomProfiles(
                    profileCount: model.profileThumbnails.length > 4
                        ? 4
                        : model.profileThumbnails.length,
                    profileSize:
                        model.profileThumbnails.length < 2 ? 45.0 : 30.0,
                  ),
                  ChatRoomInfo(
                    date: model.date,
                    location: model.location,
                    chatTitle: model.chatTitle,
                    latestMsg: model.latestMsg!,
                    latestTime: model.latestTime!,
                    notReadMsg: model.notReadMsg!,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
