import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';
import 'package:sottie_flutter/use_case/friend/friend_use_case.dart';
import 'package:sottie_flutter/use_case/user/user_use_case.dart';

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
      appBar: AppBar(backgroundColor: AppColors.whiteSilverColor),
      backgroundColor: AppColors.whiteSilverColor,
      body: Column(
        children: [
          // 계속 디테일 스크린으로 들어가는 것을 방지
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5 * ScreenSize.hu,
              horizontal: 16 * ScreenSize.wu,
            ),
            child: SottieUser(
              model: model,
              isMyFriend: isMyFriend,
              heroTag: heroTag,
              goToDetailPath: false,
            ),
          ),
          SizedBox(height: 10 * ScreenSize.hu),
          if (isMyFriend != null)
            SizedBox(
              height: 50 * ScreenSize.hu,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isMyFriend!
                      ? _utilButton(FontAwesomeIcons.message, 'DM', () {
                        FriendUseCase.friendSendDm(context);
                      })
                      : _utilButton(FontAwesomeIcons.userPlus, '추가', () {
                        FriendUseCase.friendAdd(context);
                      }),
                  _utilButton(FontAwesomeIcons.ban, '차단', () {
                    UserUseCase.userBlock(context);
                  }),
                  _utilButton(FontAwesomeIcons.circleExclamation, '신고', () {
                    UserUseCase.userReport(context);
                  }),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "매너 온도",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  model.mannerTemperature.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
        FaIcon(icon, size: 16 * ScreenSize.hu),
        SizedBox(height: 2 * ScreenSize.hu),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10 * ScreenSize.hu,
          ),
        ),
      ],
    ),
  );
}
