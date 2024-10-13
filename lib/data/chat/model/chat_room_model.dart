import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  factory ChatRoomModel({
    /// 채팅방 상태 관계 없이 반드시 받아야 하는 값
    required String id,
    required String inChatId, /// 해당 채팅방을 터치한 후 들어갔을 때의 방 id(필요한지 모르겠음)
    required List<String> category, /// 채팅의 카테고리(친목, 번개, 구인/구직 등)
    required String date, /// 모임 날짜
    required String location, /// 모임 장소
    required String chatTitle, /// 채팅 제목

    /// isChatRoomGenerated에 따라 생성된 채팅방과 생성 대기중인 채팅방 구현
    required bool isChatRoomGenerated,

    /// isChatRoomGenerated에 == true ? 필수 파라미터 : 필요 없는 파라미터
    List<String>? profileThumbnails, /// 최대 4개까지만, 프로필 사진 설정한 유저가 4명 이상 없을 경우 유저의 id로 전송(Random Avatar)
    String? latestMsg, /// 유저가 읽지 않은 메세지 내용
    String? latestTime, /// 최근 전송 받은 메세지의 시각
    int? notReadMsg, /// 유저가 해당하는 채팅방의 읽지 않은 메세지 수

    /// 성비 제한이 없을 경우 currentMemberCount, maxMemberCount
    /// 성비 제한이 있을 경우 currentManCount, maxManCount, currentWomanCount, maxWomanCount
    int? currentMemberCount,
    int? maxMemberCount,
    int? currentManCount,
    int? maxManCount,
    int? currentWomanCount,
    int? maxWomanCount,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
