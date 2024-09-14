import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class ChatRoomProfiles extends StatelessWidget {
  const ChatRoomProfiles({
    super.key,
    required this.profileCount,
    required this.profileSize,
  });

  final int profileCount;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80 * wu,
      child: Wrap(
        spacing: 5 * wu,
        runSpacing: 5 * hu,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: List.generate(
          profileCount,
          (_) => UserProfile(
            randomAvatarSize: profileSize,
          ),
        ),
      ),
    );
  }
}
