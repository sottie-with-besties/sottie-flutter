import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/friend/model/friend_model.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_category.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_location.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/in_chat/widget/in_chat_photo.dart';

class InChatDrawer extends StatelessWidget {
  const InChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200 * wu,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _subTitle(
                  '채팅방 정보',
                  () {
                    context.push(
                      "${CustomRouter.chatPath}/${CustomRouter.inChatPath}/${CustomRouter.inChatInfoPath}",
                      extra: {
                        'postModel': PostModel(
                          id: '123123',
                          detailId: '123123',
                          category: [
                            SottieCategory.amity.name,
                            SottieCategory.exercise.name
                          ],
                          thumbnailUrl: null,
                          title: "안녕하세요",
                          location: SottieLocation.sungnam.name,
                          date: "2024년 9월 18일",
                          currentManCount: 3,
                          maxManCount: 6,
                          currentWomanCount: 4,
                          maxWomanCount: 7,
                        )
                      },
                    );
                  },
                ),
                _subTitle(
                  '사진, 동영상',
                  () {
                    context.push(
                        "${CustomRouter.chatPath}/${CustomRouter.inChatPath}/${CustomRouter.inChatPhotoListPath}");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 130 * hu,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) => const InChatPhoto(),
                      itemCount: 6, // 예시로 8개의 아이템을 생성합니다.
                    ),
                  ),
                ),
                _subTitle(
                  '공지사항',
                  () {
                    context.push(
                        "${CustomRouter.chatPath}/${CustomRouter.inChatPath}/${CustomRouter.inChatNotificationListPath}");
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "장소를 변경해야 할것 같아요. 성대역에서 수원역으로 바꾸고 시간을 1시간정도 늦춰야 할 것 같습니다. 정말 죄송합니다.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 30),
                _subTitle(
                  '참여자',
                  () {
                    log("참여자 목록");
                  },
                ),
                _inChatParticipant(context, "1", "김진표"),
                _inChatParticipant(context, "2", "김진표"),
                _inChatParticipant(context, "3", "김진표"),
                _inChatParticipant(context, "4", "김진표"),
                _inChatParticipant(context, "5", "김진표"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _subTitle(String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12 * hu,
              ),
            ),
            const Icon(Icons.arrow_right_alt),
          ],
        ),
      ),
    ),
  );
}

Widget _inChatParticipant(BuildContext context, String id, String name) {
  return InkWell(
    onTap: () {
      context.push(
        "${CustomRouter.friendPath}/${CustomRouter.friendDetailPath}",
        extra: {
          'model': FriendModel(
            id: id,
            nickname: name,
            stateMsg: '',
          ),
          'isMyFriend': false,
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Row(
        children: [
          UserProfile(
            profileUrl: id,
            randomAvatarSize: 30,
          ),
          SizedBox(width: 10 * wu),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
