import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'friend_model_list.freezed.dart';
part 'friend_model_list.g.dart';

@freezed
class FriendModelList with _$FriendModelList {
  factory FriendModelList({
    required List<UserModel> friendList,
  }) = _FriendModelList;

  factory FriendModelList.fromJson(Map<String, dynamic> json) =>
      _$FriendModelListFromJson(json);
}
