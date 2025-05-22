import 'package:flutter/material.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

/// 채팅방 읽음처리 위젯
/// 인스타그램 DM 스타일로 메시지를 읽은 사용자의 작은 프로필 이미지 표시
class InChatReadReceipts extends StatelessWidget {
  const InChatReadReceipts({super.key, required this.userList});

  /// 채팅방 사용자 목록
  final List<UserModel> userList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:
            userList.map((user) {
              return Padding(
                padding: EdgeInsets.only(left: 2 * ScreenSize.wu),
                child: UserProfile(
                  profileUrl: user.profileUrl,
                  profileSize: 20,
                ),
              );
            }).toList(),
      ),
    );
  }
}
