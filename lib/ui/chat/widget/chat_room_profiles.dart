import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

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
      width: 80 * ScreenSize.wu,
      child: Wrap(
        spacing: 5 * ScreenSize.wu,
        runSpacing: 5 * ScreenSize.hu,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: List.generate(profileCount, (_) => const UserProfile()),
      ),
    );
  }
}
