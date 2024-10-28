import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
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
        appBarActions: [
          GestureDetector(
            onTap: () {
              log("친구 추가");
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 24),
              child: FaIcon(
                FontAwesomeIcons.userPlus,
                color: mainBlackColor,
              ),
            ),
          ),
        ],
        header: FriendHeader(focusNode: focusNode),
        contentChild: const FriendListScreen(),
      ),
    );
  }
}
