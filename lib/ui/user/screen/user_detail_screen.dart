import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/domain/friend/friend_manage.dart';
import 'package:sottie_flutter/domain/user/user_manage.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    required this.model,
    required this.heroTag,
    required this.isMyFriend,
  });

  final UserModel model;
  final String heroTag;
  final bool? isMyFriend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mainWhiteSilverColor),
      backgroundColor: mainWhiteSilverColor,
      body: Column(
        children: [
          // 계속 디테일 스크린으로 들어가는 것을 방지
          IgnorePointer(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 5 * hu, horizontal: 16 * wu),
              child: SottieUser(
                model: model,
                isMyFriend: isMyFriend,
                heroTag: heroTag,
              ),
            ),
          ),
          SizedBox(height: 10 * hu),
          if (isMyFriend != null)
            SizedBox(
              height: 50 * hu,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isMyFriend!
                      ? _utilButton(
                          FontAwesomeIcons.message,
                          'DM',
                          () {
                            friendSendDm(context);
                          },
                        )
                      : _utilButton(
                          FontAwesomeIcons.userPlus,
                          '추가',
                          () {
                            friendAdd(context);
                          },
                        ),
                  _utilButton(
                    FontAwesomeIcons.ban,
                    '차단',
                    () {
                      userBlock(context);
                    },
                  ),
                  _utilButton(
                    FontAwesomeIcons.circleExclamation,
                    '신고',
                    () {
                      userReport(context);
                    },
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "매너 온도",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "56.2°C",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _utilButton(IconData icon, String desc, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 16 * hu,
        ),
        SizedBox(height: 2 * hu),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10 * hu,
          ),
        )
      ],
    ),
  );
}
