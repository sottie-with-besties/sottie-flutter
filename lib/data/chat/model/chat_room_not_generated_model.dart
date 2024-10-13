import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_not_generated_model.freezed.dart';

part 'chat_room_not_generated_model.g.dart';

@freezed
class ChatRoomNotGeneratedModel with _$ChatRoomNotGeneratedModel {
  factory ChatRoomNotGeneratedModel({
    /// 채팅방 상태 관계 없이 반드시 받아야 하는 값
    required String id,

    /// 해당 채팅방을 터치한 후 들어갔을 때의 방 id(필요한지 모르겠음)
    required String inChatId,

    /// 채팅의 카테고리(친목, 번개, 구인/구직 등)

    required List<String> category,

    /// 모임 날짜

    required String date,

    /// 모임 장소
    required String location,

    /// 채팅 제목
    required String chatTitle,

    /// 성비 제한이 없을 경우 currentMemberCount, maxMemberCount
    /// 성비 제한이 있을 경우 currentManCount, maxManCount, currentWomanCount, maxWomanCount
    int? currentMemberCount,
    int? maxMemberCount,
    int? currentManCount,
    int? maxManCount,
    int? currentWomanCount,
    int? maxWomanCount,
  }) = _ChatRoomNotGeneratedModel;

  factory ChatRoomNotGeneratedModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomNotGeneratedModelFromJson(json);
}
