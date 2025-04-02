import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_dev_repository_impl.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_dummy.dart';

part 'friend_provider.g.dart';

final _repo = FriendDevRepositoryImpl(cleanDio);

@Riverpod(keepAlive: true)
final class FriendState extends _$FriendState {
  @override
  Future<List<UserDTO>> build() {
    return getFriendDummy();
  }
}
