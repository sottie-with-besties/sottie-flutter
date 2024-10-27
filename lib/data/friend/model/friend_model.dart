import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendModel with _$FriendModel {
  factory FriendModel({
    /// 친구 ID
    required String id,

    /// 친구 닉네임
    required String nickname,

    /// 친구 상태 메세지
    required String? stateMsg,

    /// 프로필 URL, 프로필 없으면 id로 랜덤 아바타 생성
    String? profileUrl,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);
}
