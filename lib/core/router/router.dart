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

  static const oAuthPath = "/oauth";
  static const homePath = "/home";
  static const searchPath = "/search";
  static const chatPath = "/chat";
  static const morePath = "/more";
}

final _routes = [
  GoRoute(
    path: CustomRouter.oAuthPath,
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
              path: CustomRouter.homePath,
              builder: (context, state) => const HomeScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: CustomRouter.searchPath,
              builder: (context, state) => const SearchScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: CustomRouter.chatPath,
              builder: (context, state) => const ChatScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <GoRoute>[
            GoRoute(
              path: CustomRouter.morePath,
              builder: (context, state) => const MoreScreen(),
            )
          ],
        ),
      ]),
];
