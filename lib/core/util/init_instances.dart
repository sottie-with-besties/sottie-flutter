import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/provider/auth/auth_provider.dart';
import 'package:sottie_flutter/provider/auth/verification_provider.dart';
import 'package:sottie_flutter/provider/friend/friend_manage_provider.dart';
import 'package:sottie_flutter/provider/post/post_provider.dart';
import 'package:sottie_flutter/provider/user/user_manage_provider.dart';

void initInstances() {
  GetIt.I.registerSingleton<AuthProvider>(AuthProvider());
  GetIt.I.registerSingleton<VerificationProvider>(VerificationProvider());
  GetIt.I.registerSingleton<PostProvider>(PostProvider());
  GetIt.I.registerSingleton<FriendManageProvider>(FriendManageProvider());
  GetIt.I.registerSingleton<UserManageProvider>(UserManageProvider());
}
