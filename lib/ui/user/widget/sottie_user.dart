import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/controller/my_info_controller.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

class SottieUser extends StatelessWidget {
  const SottieUser({
    super.key,
    required this.model,
    required this.heroTag,
    required this.isMyFriend,
    this.goToDetailPath = true,
    this.textWidth = 200,
  });

  final UserModel model;
  final String heroTag;
  final bool? isMyFriend;
  final bool goToDetailPath;
  final double textWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          goToDetailPath
              ? () {
                context.push(
                  CustomRouter.userDetailPath,
                  extra: {
                    'model': model,
                    'heroTag': heroTag,
                    'isMyFriend': isMyFriend,
                  },
                );
              }
              : null,
      child: Container(
        color: Colors.transparent, // GestureDetector에 모든 영역이 감지되기 위함
        child: Row(
          children: [
            Hero(
              tag: '${model.id}/$heroTag',
              child: UserProfile(
                profileUrl: model.profileUrl,
                myProfileXFilePath:
                    isMyFriend == null
                        ? MyInfoController.myInfoModel.myProfilePath
                        : null,
              ),
            ),
            SizedBox(width: 15 * ScreenSize.wu),
            SizedBox(
              width: textWidth * ScreenSize.wu,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    model.nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5 * ScreenSize.hu),

                  /// Todo: stateMsg가 아닌 그냥 message로 바꾸기(?)
                  /// Todo: DM 아래에는 최근 메세지가 오는 게 좋겠음
                  Text(
                    overflow: TextOverflow.ellipsis,
                    model.stateMsg ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
