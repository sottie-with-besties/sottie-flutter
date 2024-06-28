import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.pinned = false,
    this.appBarHeight = 100,
    this.collapsedHeight,
    required this.appBarChild,
    required this.shellChild,
  });

  final bool pinned;
  final double appBarHeight;
  final double? collapsedHeight;

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
            backgroundColor: mainBrownColor,
            pinned: pinned,
            expandedHeight: appBarHeight,
            collapsedHeight: collapsedHeight,
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
