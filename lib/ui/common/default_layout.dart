import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.pinned = false,
    required this.appBarChild,
    required this.shellChild,
  });

  final bool pinned;

  final Widget appBarChild;
  final Widget shellChild;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: mainBrownColor,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            backgroundColor: mainBrownColor,
            pinned: false,
            floating: true,
            flexibleSpace: SafeArea(
              child: appBarChild,
            ),
          ),
          SliverAppBar(
            toolbarHeight: 30,
            backgroundColor: mainBrownColor,
            pinned: pinned,
            flexibleSpace: SafeArea(
              child: appBarChild,
            ),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: mainSilverColor,
                  ),
                  child: shellChild,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
