import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/ui/auth/screen/oauth_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_screen.dart';
import 'package:sottie_flutter/ui/common/navigation_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_screen.dart';
import 'package:sottie_flutter/ui/more/screen/more_screen.dart';
import 'package:sottie_flutter/ui/search/screen/search_screen.dart';

sealed class CustomRouter {
  static final router = GoRouter(
    initialLocation: '/oauth',
    routes: _routes,
  );

  static const oAuthName = "oAuthScreen";
  static const homeName = "homeScreen";
  static const searchName = "searchScreen";
  static const chatName = "chatScreen";
  static const moreName = "moreScreen";
}

final _routes = [
  GoRoute(
    path: '/oauth',
    name: CustomRouter.oAuthName,
    builder: (context, state) => const OAuthScreen(),
  ),
  StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => NavigationScreen(
            shell: shell,
          ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: '/home',
              name: CustomRouter.homeName,
              builder: (context, state) => const HomeScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: '/search',
              name: CustomRouter.searchName,
              builder: (context, state) => const SearchScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: '/chat',
              name: CustomRouter.chatName,
              builder: (context, state) => const ChatScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: '/more',
              name: CustomRouter.moreName,
              builder: (context, state) => const MoreScreen(),
            )
          ],
        ),
      ]),
];
