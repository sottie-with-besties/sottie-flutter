import 'dart:io';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/go_to_network_image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.profileUrl,
    this.randomAvatarSize = 80,
    this.profileAvatarSize = 40,
    this.myProfileXFilePath,
  });

  final String profileUrl;
  final double randomAvatarSize;
  final double profileAvatarSize;
  final String? myProfileXFilePath;

  @override
  Widget build(BuildContext context) {
    // Todo: 사용자가 프로필사진 Path를 변경 또는 기존 프로필사진을 제거했을 때 예외 처리
    final isUrl = profileUrl.length > 3 && profileUrl.substring(0, 4) == 'http';

    return myProfileXFilePath == null
        ? isUrl
            ? GoToNetworkImage(
                imageUrl: profileUrl,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                  // Todo: CachedNetworkImage로 변경
                  radius: profileAvatarSize * hu,
                ),
              )
            : RandomAvatar(
                profileUrl,
                width: randomAvatarSize * hu,
                height: randomAvatarSize * hu,
              )
        : CircleAvatar(
            backgroundImage: FileImage(File(myProfileXFilePath!)),
            radius: profileAvatarSize * hu,
          );
  }
}
