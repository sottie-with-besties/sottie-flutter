import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/ui/auth/screen/auth_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/certification_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_id_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_password.dart';
import 'package:sottie_flutter/ui/auth/screen/sign_up_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/verification_complete_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_screen.dart';
import 'package:sottie_flutter/ui/common/screen/navigation_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_detail_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_screen.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_screen.dart';
import 'package:sottie_flutter/ui/more/screen/email_change_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/contact_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_customer_service_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_event_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_guide_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_notice_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_setting_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_store_screen.dart';
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

  // Home
  static const homePath = "/home";

  // Chat
  static const chatPath = "/chat";
  static const inChatPath = "inChat";

  // Friend
  static const friendPath = "/friend";
  static const friendDetailPath = "friendDetail";

  // More
  static const morePath = "/more";

  static const infoModifyPath = "modify";
  static const emailChangePath = "emailChange";

  static const storePath = "store";
  static const eventPath = "event";
  static const noticePath = "notice";

  static const customerServicePath = "customerService";
  static const contactPath = "contact";

  static const settingPath = "setting";
  static const guidePath = "guide";

  // Make Post Screen
  static const makePostStepOnePath = "/makePostStepOne";
  static const makePostStepTwoPath = "makePostStepTwo";
  static const makePostStepThreePath = "makePostStepThree";

  // Post Detail Screen
  static const postDetailPath = "/postDetail";
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
          final params = state.extra as Map<String, bool>;
          final isModifyInfo = params['isModifyInfo'] ?? false;
          return CertificationScreen(isModifyInfo: isModifyInfo);
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
            routes: <GoRoute>[
              GoRoute(
                path: CustomRouter.inChatPath,
                builder: (_, state) {
                  final params = state.extra as Map<String, dynamic>;
                  return InChatScreen(
                    id: params['id'],
                    title: params['title'],
                    isGenerated: params['isGenerated'],
                  );
                },
              ),
            ],
          )
        ],
      ),
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.friendPath,
            builder: (_, __) => const FriendScreen(),
            routes: <GoRoute>[
              GoRoute(
                path: CustomRouter.friendDetailPath,
                builder: (_, state) {
                  final params = state.extra as Map<String, dynamic>;

                  return FriendDetailScreen(
                    model: params['model'],
                    isMyFriend: params['isMyFriend'],
                  );
                },
              ),
            ],
          ),
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
                routes: <GoRoute>[
                  GoRoute(
                    path: CustomRouter.emailChangePath,
                    builder: (_, __) => const EmailChangeScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: CustomRouter.storePath,
                builder: (_, __) => const ExtraStoreScreen(),
              ),
              GoRoute(
                path: CustomRouter.eventPath,
                builder: (_, __) => const ExtraEventScreen(),
              ),
              GoRoute(
                path: CustomRouter.noticePath,
                builder: (_, __) => const ExtraNoticeScreen(),
              ),
              GoRoute(
                path: CustomRouter.customerServicePath,
                builder: (_, __) => const ExtraCustomerServiceScreen(),
                routes: <GoRoute>[
                  GoRoute(
                    path: CustomRouter.contactPath,
                    builder: (_, __) => const ContactScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: CustomRouter.settingPath,
                builder: (_, __) => const ExtraSettingScreen(),
              ),
              GoRoute(
                path: CustomRouter.guidePath,
                builder: (_, __) => const ExtraGuideScreen(),
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
          ),
        ],
      )
    ],
  ),
  GoRoute(
    path: CustomRouter.postDetailPath,
    builder: (_, state) {
      final params = state.extra as Map<String, dynamic>;
      return PostDetailScreen(
        postModel: params['postModel'],
      );
    },
  ),
];
