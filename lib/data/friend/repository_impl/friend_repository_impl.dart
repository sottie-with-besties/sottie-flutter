import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_repository_impl.g.dart';

@RestApi(baseUrl: serverIp)
abstract class FriendRepositoryImpl {
  factory FriendRepositoryImpl(Dio dio, {String baseUrl}) =
      _FriendRepositoryImpl;

  @GET('/sottie/friends')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<UserModel>> getFriends();
}
