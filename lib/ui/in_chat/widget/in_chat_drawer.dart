import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

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
                _subTitle('사진, 동영상'),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      _pictureDummy,
                      _pictureDummy,
                      _pictureDummy,
                      _pictureDummy,
                      _pictureDummy,
                      _pictureDummy,
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _subTitle('공지사항'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "장소를 변경해야 할것 같아요. 성대역에서 수원역으로 바꾸고 시간을 1시간정도 늦춰야 할 것 같습니다. 정말 죄송합니다.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 30),
                _subTitle('참여자'),
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

Widget _subTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: GestureDetector(
      onTap: () {},
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
      // context.push("${CustomRouter.friendPath}/${CustomRouter.friendDetailPath}");
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Row(
        children: [
          UserProfile(
            avatarId: id,
            randomAvatarSize: 30,
          ),
          SizedBox(width: 10 * wu),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

final _pictureDummy = Container(
  decoration: BoxDecoration(
    border: Border.all(),
  ),
  width: 50 * hu,
  height: 50 * hu,
  child: const Center(
    child: Text("사진"),
  ),
);
