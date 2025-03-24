import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/domain/chat/use_case/chat_use_case.dart';
import 'package:sottie_flutter/domain/post/use_case/post_use_case.dart';
import 'package:sottie_flutter/provider/auth/auth_provider.dart';
import 'package:sottie_flutter/provider/auth/verification_provider.dart';
import 'package:sottie_flutter/provider/friend/friend_manage_provider.dart';
import 'package:sottie_flutter/provider/post/post_provider.dart';
import 'package:sottie_flutter/provider/user/user_manage_provider.dart';

void initInstances() {
  /// 프로바이더
  GetIt.I.registerSingleton<AuthProvider>(AuthProvider());
  GetIt.I.registerSingleton<VerificationProvider>(VerificationProvider());
  GetIt.I.registerSingleton<PostProvider>(PostProvider());
  GetIt.I.registerSingleton<FriendManageProvider>(FriendManageProvider());
  GetIt.I.registerSingleton<UserManageProvider>(UserManageProvider());

  /// 유스 케이스
  GetIt.I.registerSingleton<PostUseCase>(PostUseCase());
  GetIt.I.registerSingleton<ChatUseCase>(ChatUseCase());
}
