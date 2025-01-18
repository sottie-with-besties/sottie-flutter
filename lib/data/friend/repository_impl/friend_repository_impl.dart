import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/rest_api/repository_env.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_repository_impl.g.dart';

@RestApi(baseUrl: devServerIp)
abstract class FriendRepositoryImpl {
  factory FriendRepositoryImpl(Dio dio, {String baseUrl}) =
      _FriendRepositoryImpl;

  @GET('/sottie/friends')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<UserModel>> getFriends();
}
