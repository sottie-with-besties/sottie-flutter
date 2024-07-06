import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  factory ChatRoomModel({
    required String id,
    required String inChatId,
    required String date,
    required String location,
    required String chatTitle,
    required String latestMsg,
    required String latestTime,
    required int numOfMember,
    required int notReadMsg,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
