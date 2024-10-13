import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) => shell.goBranch(index),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.houseChimney),
            selectedIcon: FaIcon(
              FontAwesomeIcons.houseChimney,
              color: mainWhiteSilverColor,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.comments),
            selectedIcon: FaIcon(
              FontAwesomeIcons.comments,
              color: mainWhiteSilverColor,
            ),
            label: "Chat",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.userGroup),
            selectedIcon: FaIcon(
              FontAwesomeIcons.userGroup,
              color: mainWhiteSilverColor,
            ),
            label: "Friends",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.ellipsis),
            selectedIcon: FaIcon(
              FontAwesomeIcons.ellipsis,
              color: mainWhiteSilverColor,
            ),
            label: "More",
          ),
        ],
      ),
    );
  }
}
