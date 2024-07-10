import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({
    super.key,
    required this.profileCount,
    required this.profileSize,
  });

  final int profileCount;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: List.generate(
          profileCount,
          (_) => RandomAvatar(
            DateTime.now().toIso8601String(),
            width: profileSize,
            height: profileSize,
          ),
        ),
      ),
    );
  }
}
