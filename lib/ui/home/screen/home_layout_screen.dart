import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/modal_controller.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';
import 'package:sottie_flutter/ui/home/screen/home_alarm_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_content_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_search_options_screen.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

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
                  ModalController.showCustomModalBottomSheet(
                    context,
                    const HomeSearchOptionsScreen(),
                  );
                },
                child: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.blackColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 25),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  ModalController.showCustomModalBottomSheet(
                    context,
                    const HomeAlarmScreen(),
                  );
                },
                child: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: AppColors.blackColor,
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
                  color: AppColors.blackColor,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blueColor,
        onPressed: () async {
          postOptionsSetting = PostOptionsSetting();
          await context.push(CustomRouter.makePostStepOnePath);
        },
        child: const Icon(Icons.post_add, color: AppColors.whiteSilverColor),
      ),
      contentChild: const HomeContentScreen(),
    );
  }
}
