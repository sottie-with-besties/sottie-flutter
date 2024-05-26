import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/ui/auth/oauth_screen.dart';

sealed class CustomRouter {
  static final router = GoRouter(
    initialLocation: '/oauth',
    routes: _routes,
  );

  static const oAuthName = "oAuthPath";
}

final _routes = <GoRoute>[
  GoRoute(
    path: '/oauth',
    name: CustomRouter.oAuthName,
    builder: (context, state) => const OAuthScreen(),
  )
];
