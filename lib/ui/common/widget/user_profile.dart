import 'dart:io';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.avatarId,
    this.randomAvatarSize = 80,
    this.profileAvatarSize = 40,
    this.profileUrl,
    this.me = false,
  });

  final String? avatarId;
  final double randomAvatarSize;
  final String? profileUrl;
  final double profileAvatarSize;
  final bool me;

  @override
  Widget build(BuildContext context) {
    return profileUrl == null
        ? RandomAvatar(
            avatarId ?? DateTime.now().toIso8601String(),
            width: randomAvatarSize * hu,
            height: randomAvatarSize * hu,
          )
        : CircleAvatar(
            backgroundImage:
                me ? FileImage(File(profileUrl!)) : NetworkImage(profileUrl!),
            radius: profileAvatarSize * hu,
          );
  }
}
