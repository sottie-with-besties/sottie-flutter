import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/friend/repository_impl/friend_dummy.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_provider.g.dart';

@Riverpod(keepAlive: true)
final class FriendState extends _$FriendState {
  @override
  Future<List<UserModel>> build() {
    return getFriendDummy();
  }
}
