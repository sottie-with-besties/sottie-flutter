import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.contentChild,
    this.title,
    this.header,
  });

  final Widget contentChild;

  final Widget? title;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppbar(title),
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
                flexibleSpace: header,
              ),
            SliverFillRemaining(
              hasScrollBody: false,
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

AppBar? _renderAppbar(Widget? title) {
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
              child: const FaIcon(
                FontAwesomeIcons.plus,
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
