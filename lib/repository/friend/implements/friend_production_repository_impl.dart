import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/rest_api/repository_env.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';

part 'friend_production_repository_impl.g.dart';

@RestApi(baseUrl: productionServerIp)
abstract class FriendProductionRepositoryImpl implements FriendRepository {
  factory FriendProductionRepositoryImpl(Dio dio, {String baseUrl}) =
      _FriendProductionRepositoryImpl;

  @override
  @GET('/sottie/friends')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<UserDTO>> getFriends();
}
