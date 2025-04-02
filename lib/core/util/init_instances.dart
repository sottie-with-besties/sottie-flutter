import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/use_case/auth/auth_use_case.dart';
import 'package:sottie_flutter/use_case/auth/verification_use_case.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';
import 'package:sottie_flutter/use_case/friend/friend_use_case.dart';
import 'package:sottie_flutter/use_case/post/post_use_case.dart';
import 'package:sottie_flutter/use_case/user/user_use_case.dart';

void initInstances() {
  /// 프로바이더
  GetIt.I.registerSingleton<AuthUseCase>(AuthUseCase());
  GetIt.I.registerSingleton<VerificationUseCase>(VerificationUseCase());
  GetIt.I.registerSingleton<PostUseCase>(PostUseCase());
  GetIt.I.registerSingleton<FriendUseCase>(FriendUseCase());
  GetIt.I.registerSingleton<UserUseCase>(UserUseCase());

  /// 유스 케이스
  GetIt.I.registerSingleton<PostUseCase>(PostUseCase());
  GetIt.I.registerSingleton<ChatUseCase>(ChatUseCase());
}
