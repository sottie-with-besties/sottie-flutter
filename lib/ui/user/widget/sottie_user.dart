import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/user/entity/my_info_entity.dart';
import 'package:sottie_flutter/model/user/entity/user_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

class SottieUser extends StatelessWidget {
  const SottieUser({
    super.key,
    required this.entity,
    required this.heroTag,
    required this.isMyFriend,
    this.goToDetailPath = true,
    this.textWidth = 200,
  });

  final UserEntity entity;
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
                    'entity': entity,
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
              tag: '${entity.id}/$heroTag',
              child: UserProfile(
                profileUrl: entity.profileUrl,
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
                    entity.nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5 * hu),

                  /// Todo: stateMsg가 아닌 그냥 message로 바꾸기(?)
                  /// Todo: DM 아래에는 최근 메세지가 오는 게 좋겠음
                  Text(
                    overflow: TextOverflow.ellipsis,
                    entity.stateMsg ?? '',
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
