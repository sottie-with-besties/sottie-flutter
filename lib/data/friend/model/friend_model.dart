import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendModel with _$FriendModel {
  factory FriendModel({
    required String id,
    required String nickname,
    required String? stateMsg,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);
}
