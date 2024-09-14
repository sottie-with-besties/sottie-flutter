import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  factory ChatRoomModel({
    required String id,
    required String inChatId,
    required List<String> profileThumbnails,
    required List<String> category,
    required String date,
    required String location,
    required String chatTitle,
    required String latestMsg,
    required String latestTime,
    required int notReadMsg,
    required bool isChatRoomGenerated,
    required int? currentMemberCount,
    required int? maxMemberCount,
    required int? currentManCount,
    required int? maxManCount,
    required int? currentWomanCount,
    required int? maxWomanCount,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
