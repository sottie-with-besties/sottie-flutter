import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70 * wu,
      child: RandomAvatar(
        DateTime.now().toIso8601String(),
        width: 45 * hu,
        height: 45 * hu,
      ),
    );
  }
}
