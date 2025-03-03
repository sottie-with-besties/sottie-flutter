import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.profileUrl,
    this.profileSize = 30,
    this.myProfileXFilePath,
  });

  final String? profileUrl;
  final double profileSize;
  final String? myProfileXFilePath;

  @override
  Widget build(BuildContext context) {
    final hasProfileUrl = profileUrl != null;

    /// 유저가 내 이미지를 변경하였을 때 바로 변화할 수 있도록
    return myProfileXFilePath != null
        ? _defaultProfile(profileSize, myProfileXFilePath)
        : hasProfileUrl
        ? _hasProfile(profileUrl!, profileSize)
        : _defaultProfile(profileSize, null);
  }
}

/// 기본 프로필
ClipRRect _defaultProfile(
  double size,
  String? assetPath, [
  IconData icon = FontAwesomeIcons.user,
]) {
  final hasAssetPath = assetPath != null;

  return ClipRRect(
    borderRadius: BorderRadius.circular(14),
    child: SizedBox(
      width: size * hu,
      height: size * hu,
      child:
          hasAssetPath
              ? AspectRatio(
                aspectRatio: 1,
                child: Image.asset(assetPath, fit: BoxFit.cover),
              )
              : ColoredBox(
                color: mainBlueColor,
                child: FittedBox(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FaIcon(icon, color: mainWhiteSilverColor),
                    ),
                  ),
                ),
              ),
    ),
  );
}

/// 프로필 설정한 경우
SizedBox _hasProfile(String imageUrl, double size) {
  return SizedBox(
    width: size * hu,
    height: size * hu,
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder:
          (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image(image: imageProvider, fit: BoxFit.cover),
          ),
      errorWidget:
          (_, __, ___) => _defaultProfile(size, null, Icons.error_outline),
      placeholder:
          (_, __) => _defaultProfile(size, null, Icons.more_horiz_outlined),
    ),
  );
}
