import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/rest_api/repository_env.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/domain/friend/repository_interface/friend_repository.dart';

part 'friend_dev_repository_impl.g.dart';

@RestApi(baseUrl: devServerIp)
abstract class FriendDevRepositoryImpl implements FriendRepository {
  factory FriendDevRepositoryImpl(Dio dio, {String baseUrl}) =
      _FriendDevRepositoryImpl;

  @override
  @GET('/sottie/friends')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<UserModel>> getFriends();
}
