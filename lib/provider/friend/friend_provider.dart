import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/use_case/friend/friend_use_case.dart';

part 'friend_provider.g.dart';

@Riverpod(keepAlive: true)
final class FriendState extends _$FriendState {
  @override
  Future<List<UserModel>> build() {
    return FriendUseCase.getFriendsList();
  }
}
