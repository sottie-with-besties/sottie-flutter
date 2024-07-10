import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_list_screen.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_header.dart';
import 'package:sottie_flutter/ui/home/controller/home_header_controller.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: DefaultLayout(
        hasScrollBody: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: AppBarTitle(
            title: '친구',
          ),
        ),
        header: FriendHeader(focusNode: focusNode),
        contentChild: FriendListScreen(),
      ),
    );
  }
}
