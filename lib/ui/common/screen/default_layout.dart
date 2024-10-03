import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_setting.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/alarm/screen/alarm_screen.dart';
import 'package:sottie_flutter/ui/common/controller/show_actions_sheet.dart';
import 'package:sottie_flutter/ui/search/screen/search_screen.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.contentChild,
    this.title,
    this.header,
    required this.hasScrollBody,
  });

  final Widget contentChild;

  final Widget? title;
  final Widget? header;

  final bool hasScrollBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null, // Friend의 히어로와 충돌 방지
        backgroundColor: lightBrownColor,
        onPressed: () async {
          postSettingEntity = PostSetting();
          await context.push(CustomRouter.makePostStepOnePath);
        },
        child: const Icon(
          Icons.post_add,
          color: mainSilverColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: _renderAppbar(title, context),
      body: ColoredBox(
        color: mainBrownColor,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            if (header != null)
              SliverAppBar(
                toolbarHeight: 70,
                backgroundColor: mainBrownColor,
                floating: true,
                snap: true,
                flexibleSpace: header,
              ),
            SliverFillRemaining(
              hasScrollBody: hasScrollBody,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  color: mainSilverColor,
                ),
                child: contentChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar? _renderAppbar(Widget? title, BuildContext context) {
  if (title == null) {
    return null;
  }

  return AppBar(
    centerTitle: false,
    toolbarHeight: 80,
    backgroundColor: mainBrownColor,
    title: title,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                bottomSheet(
                  context,
                  const SearchScreen(),
                );
              },
              child: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: mainSilverColor,
                size: 28,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                bottomSheet(
                  context,
                  const AlarmScreen(),
                );
              },
              child: const FaIcon(
                FontAwesomeIcons.bell,
                color: mainSilverColor,
                size: 28,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () async {
                await context.push(
                    "${CustomRouter.morePath}/${CustomRouter.settingPath}");
              },
              child: const FaIcon(
                FontAwesomeIcons.gear,
                color: mainSilverColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
