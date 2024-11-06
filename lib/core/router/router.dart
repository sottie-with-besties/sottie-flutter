import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/ui/auth/screen/auth_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/certification_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_id_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/find_password.dart';
import 'package:sottie_flutter/ui/auth/screen/sign_up_screen.dart';
import 'package:sottie_flutter/ui/auth/screen/verification_complete_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_screen.dart';
import 'package:sottie_flutter/ui/common/screen/navigation_screen.dart';
import 'package:sottie_flutter/ui/common/screen/photo_magnification_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_util_screen.dart';
import 'package:sottie_flutter/ui/home/screen/home_screen.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_info_screen.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_notification_list_screen.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_photo_list_screen.dart';
import 'package:sottie_flutter/ui/in_chat/screen/in_chat_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/contact_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/email_change_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_customer_service_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_event_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_notice_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_setting_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/extra_store_screen.dart';
import 'package:sottie_flutter/ui/more/screen/extra_services/info_modify_screen.dart';
import 'package:sottie_flutter/ui/more/screen/more_screen.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_one.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_three.dart';
import 'package:sottie_flutter/ui/post/screen/make_post_screen_step_two.dart';
import 'package:sottie_flutter/ui/post/screen/post_detail_screen.dart';
import 'package:sottie_flutter/ui/user/screen/user_detail_screen.dart';

sealed class CustomRouter {
  static final router = GoRouter(
    initialLocation: CustomRouter.authPath,
    routes: _routes,
  );

  /// Auth Screens
  static const authPath = "/auth";
  static const signUpPath = "signUp";
  static const certificationPath = "certification";
  static const findIdPath = "findId";
  static const findPasswordPath = "findPassword";
  static const verificationCompletePath = "verificationComplete";

  /// Main Layout Screens

  /// Home
  static const homePath = "/home";

  /// Chat
  static const chatPath = "/chat";
  static const inChatPath = "inChat";
  static const inChatInfoPath = "inChatInfo";
  static const inChatPhotoListPath = "inChatPhotoList";
  static const inChatNotificationListPath = "inChatNotificationList";
  static const inChatParticipationListPath = "inChatParticipationList";

  /// Friend
  static const friendPath = "/friend";
  static const friendUtilPath = "friendUtil";

  /// More
  static const morePath = "/more";

  static const infoModifyPath = "modify";
  static const emailChangePath = "emailChange";

  static const storePath = "store";
  static const eventPath = "event";
  static const noticePath = "notice";

  static const customerServicePath = "customerService";
  static const contactPath = "contact";

  static const settingPath = "setting";

  /// Make Post Screen
  static const makePostStepOnePath = "/makePostStepOne";
  static const makePostStepTwoPath = "makePostStepTwo";
  static const makePostStepThreePath = "makePostStepThree";

  /// Post Detail Screen
  static const postDetailPath = "/postDetail";

  /// User Detail Screen
  static const userDetailPath = "/userDetail";

  /// Photo Magnification Screen
  static const photoMagnificationPath = "/photoMagnification";
}

final _routes = [
  /// Authentication: 로그인, 회원가입
  GoRoute(
    path: CustomRouter.authPath,
    builder: (_, __) => const AuthScreen(),
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
          final isOauthSignUp = params['isOauthSignUp'] ?? false;
          return CertificationScreen(
            isModifyInfo: isModifyInfo,
            isOauthSignUp: isOauthSignUp,
          );
        },
      ),
      GoRoute(
        path: CustomRouter.verificationCompletePath,
        builder: (_, __) => const VerificationCompleteScreen(),
      ),
    ],
  ),

  /// Main Layout: 바텀 네비게이션 + 첫 화면
  StatefulShellRoute.indexedStack(
    builder: (context, state, shell) => NavigationScreen(
      shell: shell,
    ),
    branches: <StatefulShellBranch>[
      // 홈 화면: 최신 글, 추천 글 등
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.homePath,
            builder: (_, __) => const HomeScreen(),
          )
        ],
      ),

      /// 채팅 스크린: 모임 채팅방 + 1:1 DM 채팅방
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
                    isChattingOver: params['isChattingOver'],
                  );
                },
                routes: <GoRoute>[
                  GoRoute(
                    path: CustomRouter.inChatInfoPath,
                    builder: (_, state) {
                      final params = state.extra as Map<String, dynamic>;
                      return InChatInfoScreen(
                        postModel: params['postModel'],
                      );
                    },
                  ),
                  GoRoute(
                    path: CustomRouter.inChatPhotoListPath,
                    builder: (_, __) => const InChatPhotoListScreen(),
                  ),
                  GoRoute(
                    path: CustomRouter.inChatNotificationListPath,
                    builder: (_, __) => const InChatNotificationListScreen(),
                  ),
                  GoRoute(
                    path: CustomRouter.inChatParticipationListPath,
                    builder: (_, state) {
                      final params = state.extra as Map<String, dynamic>;
                      return InChatInfoScreen(
                        postModel: params['postModel'],
                      );
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),

      /// 친구 목록 스크린: 친구, 친구 디테일 스크린
      StatefulShellBranch(
        routes: <GoRoute>[
          GoRoute(
            path: CustomRouter.friendPath,
            builder: (_, __) => const FriendScreen(),
            routes: <GoRoute>[
              GoRoute(
                path: CustomRouter.friendUtilPath,
                builder: (_, __) => const FriendUtilScreen(),
              )
            ],
          ),
        ],
      ),

      /// 더 보기 스크린: 내 정보 수정, 로그 아웃, 공지 사항, 이벤트 등 기타 유틸리티
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
            ],
          )
        ],
      ),
    ],
  ),

  /// 모집글 생성 스크린
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

  /// 모집글 상세 화면 스크린
  GoRoute(
    path: CustomRouter.postDetailPath,
    pageBuilder: (_, state) {
      final params = state.extra as Map<String, dynamic>;

      return CustomTransitionPage(
        child: PostDetailScreen(
          postModel: params['postModel'],
          isWaiting: params['isWaiting'],
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    },
  ),

  /// 유저 디테일 스크린
  GoRoute(
    path: CustomRouter.userDetailPath,
    pageBuilder: (_, state) {
      final params = state.extra as Map<String, dynamic>;

      return CustomTransitionPage(
        child: UserDetailScreen(
          model: params['model'],
          heroTag: params['heroTag'],
          isMyFriend: params['isMyFriend'],
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    },
  ),

  /// 프로필 사진 눌렀을 때 사진 확대하여 보여주는 스크린
  GoRoute(
    path: CustomRouter.photoMagnificationPath,
    builder: (_, state) {
      final params = state.extra as Map<String, dynamic>;
      return PhotoMagnificationScreen(
        imageUrl: params['imageUrl'],
      );
    },
  ),
];
