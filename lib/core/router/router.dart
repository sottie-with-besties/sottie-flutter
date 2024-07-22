import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/ui/auth/screen/auth_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/certification_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_id_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_password.dart';
import 'package:sottie_flutter/ui/auth/screen/sign_up_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/verification_complete_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_screen.dart';
import 'package:sottie_flutter/ui/common/screen/navigation_screen.dart';
import 'package:sottie_flutter/ui/dm/screen/dm_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_screen.dart';
import 'package:sottie_flutter/ui/more/screen/more_screen.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_one.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_two.dart';
import 'package:sottie_flutter/ui/post/screen/post_detail_screen.dart';

sealed class CustomRouter {
  static final router = GoRouter(
    initialLocation: CustomRouter.authPath,
    routes: _routes,
  );

  // Auth Screens
  static const authPath = "/auth";
  static const signUpPath = "signUp";
  static const certificationPath = "certification";
  static const findIdPath = "findId";
  static const findPasswordPath = "findPassword";
  static const verificationCompletePath = "verificationComplete";

  // Main Layout Screens
  static const homePath = "/home";
  static const chatPath = "/chat";
  static const dmPath = "/dm";
  static const friendPath = "/friend";
  static const morePath = "/more";

  // Make Post Screen
  static const makePostStepOnePath = "/makePostStepOne";
  static const makePostStepTwoPath = "makePostStepTwo";

  // Find Detail Screen
  static const findDetailPath = "/findDetail";
}

final _routes = [
  GoRoute(
    path: CustomRouter.authPath,
    builder: (context, state) => const OAuthScreen(),
    routes: <GoRoute>[
      GoRoute(
        path: CustomRouter.signUpPath,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: CustomRouter.findIdPath,
        builder: (context, state) => const FindIdScreen(),
      ),
      GoRoute(
        path: CustomRouter.findPasswordPath,
        builder: (context, state) => const FindPasswordScreen(),
      ),
      GoRoute(
        path: CustomRouter.certificationPath,
        builder: (context, state) {
          final isEmailJson = state.extra as Map<String, bool>;
          final isEmail = isEmailJson['isEmailLogin'] ?? false;
          return CertificationScreen(isEmailLogin: isEmail);
        },
      ),
      GoRoute(
        path: CustomRouter.verificationCompletePath,
        builder: (context, state) => const VerificationCompleteScreen(),
      ),
    ],
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
            path: CustomRouter.chatPath,
            builder: (context, state) => const ChatScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.dmPath,
            builder: (context, state) => const DmScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.friendPath,
            builder: (context, state) => const FriendScreen(),
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
    ],
  ),
  GoRoute(
      path: CustomRouter.makePostStepOnePath,
      builder: (context, state) => const MakePostScreenStepOne(),
      routes: <GoRoute>[
        GoRoute(
          path: CustomRouter.makePostStepTwoPath,
          builder: (context, state) => const MakePostScreenStepTwo(),
        )
      ]),
  GoRoute(
    path: CustomRouter.findDetailPath,
    builder: (context, state) {
      final params = state.extra as List<dynamic>;
      String buttonTitle = params[0] as String;
      VoidCallback onPressed = params[1] as VoidCallback;
      return PostDetailScreen(buttonTitle: buttonTitle, onPressed: onPressed);
    },
  ),
];
