import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        onTap: (index) => shell.goBranch(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseCircleXmark), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.commentDots), label: "Chat"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.message), label: "DM"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.ellipsis), label: "More"),
        ],
      ),
    );
  }
}
