import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_generated_model.freezed.dart';

part 'chat_room_generated_model.g.dart';

@freezed
class ChatRoomGeneratedModel with _$ChatRoomGeneratedModel {
  factory ChatRoomGeneratedModel({
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

    /// 최대 4개까지만, 프로필 사진 설정한 유저가 4명 이상 없을 경우 유저의 id로 전송(Random Avatar)
    required List<String> profileThumbnails,

    /// 유저가 읽지 않은 메세지 내용
    required String latestMsg,

    /// 최근 전송 받은 메세지의 시각
    required String latestTime,

    /// 유저가 해당하는 채팅방의 읽지 않은 메세지 수
    required int notReadMsg,

    /// 성비 제한이 없을 경우 currentMemberCount, maxMemberCount
    /// 성비 제한이 있을 경우 currentManCount, maxManCount, currentWomanCount, maxWomanCount
    int? currentMemberCount,
    int? maxMemberCount,
    int? currentManCount,
    int? maxManCount,
    int? currentWomanCount,
    int? maxWomanCount,
  }) = _ChatRoomGeneratedModel;

  factory ChatRoomGeneratedModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomGeneratedModelFromJson(json);
}
