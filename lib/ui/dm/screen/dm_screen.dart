import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/common/widget/app_bar_title.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/dm/screen/dm_content_screen.dart';

class DmScreen extends StatelessWidget {
  const DmScreen({super.key});

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
            title: 'DM',
          ),
        ),
        header: LocalTextField(
          hint: '유저 이름, 내용...',
          focusNode: focusNode,
        ),
        contentChild: const DmContentScreen(),
      ),
    );
  }
}
