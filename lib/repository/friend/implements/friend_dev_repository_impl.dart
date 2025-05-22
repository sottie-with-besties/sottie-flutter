import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

part 'friend_dev_repository_impl.g.dart';

@RestApi(baseUrl: devServerIp)
abstract class FriendDevRepositoryImpl implements FriendRepository {
  factory FriendDevRepositoryImpl(Dio dio, {String baseUrl}) =
      _FriendDevRepositoryImpl;

  @override
  @GET('/sottie/friends')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<UserDTO>> getFriends();
}
