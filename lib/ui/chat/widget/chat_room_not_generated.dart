import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/chat/model/chat_room_not_generated_model.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_room_top.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_custom_dialog.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class ChatRoomNotGenerated extends StatelessWidget {
  const ChatRoomNotGenerated({
    super.key,
    required this.model,
  });

  final ChatRoomNotGeneratedModel model;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(model.date);

    return Material(
      color: mainWhiteSilverColor,
      child: InkWell(
        onTap: () {
          context.push(
            '${CustomRouter.chatPath}/${CustomRouter.inChatPath}',
            extra: {
              'id': model.id,
              'title': model.chatTitle,
              'isGenerated': false,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.blueAccent,
                )),
            padding: const EdgeInsets.all(8),
            height: 130 * hu,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatRoomTop(
                  categories: model.category,
                  currentMemberCount: model.currentMemberCount,
                  maxMemberCount: model.maxMemberCount,
                  currentManCount: model.currentManCount,
                  maxManCount: model.maxManCount,
                  currentWomanCount: model.currentWomanCount,
                  maxWomanCount: model.maxWomanCount,
                ),
                SizedBox(height: 10 * hu),
                const Center(
                  child: Text("인원이 모두 모이면 채팅방이 생성됩니다."),
                ),
                SizedBox(height: 10 * hu),
                Text(
                  model.chatTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12 * hu,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${date.year}년 ${date.month}월 ${date.day}일 ${renderCustomStringTime(model.date, model.date)}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          model.location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5 * hu),
                      child: GestureDetector(
                        onTap: () {
                          showCustomDialog(
                            context,
                            const Center(
                              child: Text("참여를 취소하시겠습니까?"),
                            ),
                            extraButton: ElevatedButton(
                              onPressed: () {
                                // Todo: 리스트에서 해당 채팅 삭제 및 백엔드 콜
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: const Text(
                                "참여 취소",
                                style: TextStyle(
                                  color: mainBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(8 * hu),
                          child: const FittedBox(
                            child: Text(
                              "참여 취소",
                              style: TextStyle(
                                color: mainWhiteSilverColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
