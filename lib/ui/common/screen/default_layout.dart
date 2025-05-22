import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.hasScrollBody,
    this.appBarTitle,
    this.appBarActions,
    this.header,
    this.floatingActionButton,
    required this.contentChild,
  });

  final bool hasScrollBody;

  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? header;

  final FloatingActionButton? floatingActionButton;

  final Widget contentChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: false,
      appBar: _renderAppbar(appBarTitle, appBarActions),
      body: ColoredBox(
        color: AppColors.whiteSilverColor,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            if (header != null)
              SliverAppBar(
                toolbarHeight: 70,
                backgroundColor: AppColors.whiteSilverColor,
                floating: true,
                snap: true,
                flexibleSpace: header,
                scrolledUnderElevation: 0,
              ),
            SliverFillRemaining(
              hasScrollBody: hasScrollBody,
              child: contentChild,
            ),
          ],
        ),
      ),
    );
  }
}

AppBar? _renderAppbar(String? appBarTitle, List<Widget>? appBarActions) {
  return AppBar(
    centerTitle: false,
    toolbarHeight: 80,
    backgroundColor: AppColors.whiteSilverColor,
    title: Padding(
      padding: const EdgeInsets.only(left: 5),
      child:
          appBarTitle != null
              ? Text(
                appBarTitle,
                style: GoogleFonts.jua(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: AppColors.blackColor,
                ),
              )
              : Container(),
    ),
    actions: appBarActions,
  );
}
