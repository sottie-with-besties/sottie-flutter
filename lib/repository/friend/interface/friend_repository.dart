import 'package:sottie_flutter/model/user/user_model.dart';

abstract interface class FriendRepository {
  /// 친구 데이터 불러오기
  Future<List<UserModel>> getFriends();
}
