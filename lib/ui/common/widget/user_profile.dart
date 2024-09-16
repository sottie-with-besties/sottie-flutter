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
    this.myProfileXFilePath,
  });

  final String? avatarId;
  final double randomAvatarSize;
  final double profileAvatarSize;
  final String? profileUrl;
  final String? myProfileXFilePath;

  @override
  Widget build(BuildContext context) {
    // Todo: 사용자가 프로필사진 Path를 변경 또는 기존 프로필사진을 제거했을 때 예외 처리
    return myProfileXFilePath == null
        ? profileUrl == null
            ? RandomAvatar(
                avatarId ?? DateTime.now().toIso8601String(),
                width: randomAvatarSize * hu,
                height: randomAvatarSize * hu,
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(profileUrl!),
                radius: profileAvatarSize * hu)
        : CircleAvatar(
            backgroundImage: FileImage(File(myProfileXFilePath!)),
            radius: profileAvatarSize * hu);
  }
}
