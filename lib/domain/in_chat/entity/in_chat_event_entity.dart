import 'package:sottie_flutter/domain/in_chat/entity/in_chat_enum.dart';

/// 채팅방에 입장하면 InChatEventListEntity 데이터를 한 번 받음
/// 그 후 채팅방 별로 관리
/// {roomId: inChatEventList} 로 InChatManager에서 관리
/// 포그라운드 상태에서 메세지가 도착했을 때, 채팅방에 대한 데이터 리스트가 존재한다면
/// 도착한 메세지를 데이터 리스트에 insert하여 최신 데이터 유지
final class InChatEventListEntity {
  final String roomId;
  final List<InChatEventEntity> inChatEventList;

  InChatEventListEntity({required this.roomId, required this.inChatEventList});
}

/// 최초 입장 및 InChatEventListEntity를 한 번 받았다면
/// 그 이후 InChatEventEntity를 소켓으로 통신
final class InChatEventEntity {
  /// 채팅 이벤트의 아이디 => 순서 정보 포함
  final String eventId;

  /// 이벤트 타입 { INITIAL_ENTRANCE, ENTRANCE, SEND_MESSAGE }
  final InChatEvent inChatEventType;

  /// 이벤트 발생 시각
  final DateTime timeStamp;

  /// 이벤트 상태 { SUCCESS, FAIL }
  final InChatEventStatus inChatStatus;

  /// 데이터 실재
  final InChatDataEntity inChatData;

  InChatEventEntity({
    required this.eventId,
    required this.inChatEventType,
    required this.timeStamp,
    required this.inChatStatus,
    required this.inChatData,
  });
}

final class InChatDataEntity {
  /// 데이터 아이디
  final String dataId;

  /// 이벤트를 생성한 유저 아이디
  final int userId;

  /// 데이터 타입 { ENTRANCE, CHAT, EXIT }
  final InChatDataType inChatDataType;

  /// 데이터 타입이 CHAT일 경우 { TEXT, IMAGE, VIDEO, FILE }
  final InChatMessageType inChatMessageType;

  /// 내용 => 텍스트일 경우 단순 String, 사진 및 동영상은 URL
  final String contents;

  InChatDataEntity({
    required this.userId,
    required this.dataId,
    required this.inChatDataType,
    required this.inChatMessageType,
    required this.contents,
  });
}
