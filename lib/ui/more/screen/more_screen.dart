import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/more/screen/more_content_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasScrollBody: false,
      appBarTitle: '내 정보',
      appBarActions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            children: [
              Text(
                myInfoEntity.gold.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              const FaIcon(
                FontAwesomeIcons.coins,
                color: Colors.amber,
              ),
            ],
          ),
        )
      ],
      contentChild: const MoreContentScreen(),
    );
  }
}
