import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';

part 'chat_room_waiting_list.freezed.dart';
part 'chat_room_waiting_list.g.dart';

@unfreezed
class ChatRoomWaitingList with _$ChatRoomWaitingList {
  factory ChatRoomWaitingList({
    required List<PostModel> chatRoomWaitingList,
  }) = _ChatRoomWaitingList;

  factory ChatRoomWaitingList.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomWaitingListFromJson(json);
}
