import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_list_screen.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_header.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: DefaultLayout(
        hasScrollBody: false,
        appBarTitle: '친구',
        header: FriendHeader(focusNode: focusNode),
        contentChild: const FriendListScreen(),
      ),
    );
  }
}
