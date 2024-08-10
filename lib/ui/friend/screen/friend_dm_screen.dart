import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_dm_box.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_type_box.dart';

class FriendDmScreen extends StatefulWidget {
  const FriendDmScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<FriendDmScreen> createState() => _FriendDmScreenState();
}

class _FriendDmScreenState extends State<FriendDmScreen> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color(0x00a0522d)),
        backgroundColor: lightBrownColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: widget.id,
                      child: UserProfile(
                        avatarId: widget.id,
                        randomAvatarSize: 50,
                      ),
                    ),
                    SizedBox(
                      width: 225 * wu,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "김진표",
                            style: TextStyle(
                              color: mainSilverColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * wu,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "안녕하세요 수원 사는 2000년생 김진표 입니다.",
                            style: TextStyle(
                              color: mainSilverColor,
                              fontSize: 12 * wu,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12 * hu),
                FriendDmBox(avatarId: widget.id),
                SizedBox(height: 5 * hu),
                FriendTypeBox(focusNode: focusNode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
