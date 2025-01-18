import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_data_source.g.dart';

@RestApi(baseUrl: serverIp)
abstract class FriendDataSource {
  factory FriendDataSource(Dio dio, {String baseUrl}) = _FriendDataSource;

  @GET('/sottie/friends')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<UserModel>> getFriends();
}
