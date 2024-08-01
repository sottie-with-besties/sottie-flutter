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
import 'package:sottie_flutter/ui/more/screen/info_modify_screen.dart';
import 'package:sottie_flutter/ui/more/screen/more_screen.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_one.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_three.dart';
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
  static const infoModifyPath = "modify";

  // Make Post Screen
  static const makePostStepOnePath = "/makePostStepOne";
  static const makePostStepTwoPath = "makePostStepTwo";
  static const makePostStepThreePath = "makePostStepThree";

  // Find Detail Screen
  static const findDetailPath = "/findDetail";
}

final _routes = [
  GoRoute(
    path: CustomRouter.authPath,
    builder: (_, __) => const OAuthScreen(),
    routes: <GoRoute>[
      GoRoute(
        path: CustomRouter.signUpPath,
        builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(
        path: CustomRouter.findIdPath,
        builder: (_, __) => const FindIdScreen(),
      ),
      GoRoute(
        path: CustomRouter.findPasswordPath,
        builder: (_, __) => const FindPasswordScreen(),
      ),
      GoRoute(
        path: CustomRouter.certificationPath,
        builder: (_, state) {
          final isEmailJson = state.extra as Map<String, bool>;
          final isEmail = isEmailJson['isEmailLogin'] ?? false;
          return CertificationScreen(isEmailLogin: isEmail);
        },
      ),
      GoRoute(
        path: CustomRouter.verificationCompletePath,
        builder: (_, __) => const VerificationCompleteScreen(),
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
            builder: (_, __) => const HomeScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.chatPath,
            builder: (_, __) => const ChatScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.dmPath,
            builder: (_, __) => const DmScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.friendPath,
            builder: (_, __) => const FriendScreen(),
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.morePath,
            builder: (context, state) => const MoreScreen(),
            routes: <GoRoute>[
              GoRoute(
                path: CustomRouter.infoModifyPath,
                builder: (_, __) => const InfoModifyScreen(),
              ),
            ],
          )
        ],
      ),
    ],
  ),
  GoRoute(
    path: CustomRouter.makePostStepOnePath,
    builder: (_, __) => const MakePostScreenStepOne(),
    routes: <GoRoute>[
      GoRoute(
        path: CustomRouter.makePostStepTwoPath,
        builder: (_, __) => const MakePostScreenStepTwo(),
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.makePostStepThreePath,
            builder: (_, __) => const MakePostScreenStepThree(),
          )
        ],
      )
    ],
  ),
  GoRoute(
    path: CustomRouter.findDetailPath,
    builder: (_, __) => const PostDetailScreen(),
  ),
];
