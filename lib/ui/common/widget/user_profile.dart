import 'dart:io';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

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
    final isUrl = profileUrl.length > 3 && profileUrl.substring(0, 4) == 'http';

    return myProfileXFilePath == null
        ? isUrl
            ? CircleAvatar(
                backgroundImage: NetworkImage(profileUrl),
                // Todo: CachedNetworkImage로 변경
                radius: profileAvatarSize * hu,
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
