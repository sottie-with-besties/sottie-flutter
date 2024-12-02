import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

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
      onTap: goToDetailPath
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
                profileUrl: model.profileUrl ?? '12312554',
                randomAvatarSize: 40,
                profileAvatarSize: 20,
                myProfileXFilePath:
                    isMyFriend == null ? myInfoEntity.myProfilePath : null,
              ),
            ),
            SizedBox(width: 15 * wu),
            SizedBox(
              width: textWidth * wu,
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
                  SizedBox(height: 5 * hu),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    model.stateMsg ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: mainGreyColor2,
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
