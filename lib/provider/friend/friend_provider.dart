import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/data/friend/repository_impl/friend_dev_repository_impl.dart';
import 'package:sottie_flutter/data/friend/repository_impl/friend_dummy.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_provider.g.dart';

final _repo = FriendDevRepositoryImpl(cleanDio);

@Riverpod(keepAlive: true)
final class FriendState extends _$FriendState {
  @override
  Future<List<UserModel>> build() {
    return getFriendDummy();
  }
}
