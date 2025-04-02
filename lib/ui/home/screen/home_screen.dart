import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/alarm/screen/alarm_screen.dart';
import 'package:sottie_flutter/ui/common/controller/show_actions_sheet.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/home/screen/home_content_screen.dart';
import 'package:sottie_flutter/ui/search/screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasScrollBody: true,
      appBarTitle: '모집글',
      appBarActions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  showCustomBottomSheet(context, const SearchScreen());
                },
                child: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: mainBlackColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 25),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  showCustomBottomSheet(context, const AlarmScreen());
                },
                child: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: mainBlackColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 25),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () async {
                  await context.push(
                    "${CustomRouter.morePath}/${CustomRouter.settingPath}",
                  );
                },
                child: const FaIcon(
                  FontAwesomeIcons.gear,
                  color: mainBlackColor,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainBlueColor,
        onPressed: () async {
          postOptions = PostOptionsEntity();
          await context.push(CustomRouter.makePostStepOnePath);
        },
        child: const Icon(Icons.post_add, color: mainWhiteSilverColor),
      ),
      contentChild: const HomeContentScreen(),
    );
  }
}
