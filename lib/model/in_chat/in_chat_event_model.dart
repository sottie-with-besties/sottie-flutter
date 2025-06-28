import 'package:sottie_flutter/model/in_chat/in_chat_enum.dart';
import 'package:sottie_flutter/model/user/user_model.dart';

/// 채팅방에 입장하면 InChatEventListModel 데이터를 한 번 받음
/// 그 후 채팅방 별로 관리
/// {roomId: inChatEventList} 로 InChatManager에서 관리
/// 포그라운드 상태에서 메세지가 도착했을 때, 채팅방에 대한 데이터 리스트가 존재한다면
/// 도착한 메세지를 데이터 리스트에 insert하여 최신 데이터 유지
final class InChatEventListModel {
  /// 채팅방 Id
  final String roomId;

  /// 채팅방 참여 유저 리스트
  final List<UserModel> userList;

  /// 채팅방의 이벤트 리스트 타임라인
  /// 최신 이벤트가 inChatEventList[0]에 있음
  final List<InChatEventModel> inChatEventList;

  const InChatEventListModel({
    required this.roomId,
    required this.userList,
    required this.inChatEventList,
  });
}

/// 최초 입장 및 InChatEventListModel을 한 번 받았다면
/// 그 이후 InChatEventModel을 소켓으로 통신
final class InChatEventModel {
  /// 이벤트의 아이디 => 순서 정보 포함 ex) 이벤트가 100개 발생했을 최신 eventId == 100
  final int eventId;

  /// 이벤트를 발생시킨 유저 아이디
  final String userId;

  /// 이벤트 타입 { ENTRANCE, CHAT_IN, CHAT, CHAT_OUT, EXIT }
  final InChatEventType inChatEventType;

  /// 이벤트 발생 시각
  final DateTime timeStamp;

  /// 이벤트 상태 { SUCCESS, FAIL }
  final InChatEventStatus inChatEventStatus;

  /// 이벤트 타입이 CHAT일 경우에만 존재
  /// { TEXT, IMAGE, VIDEO }
  final InChatDataType inChatDataType;

  /// 내용 => 텍스트일 경우 단순 String, 사진 및 동영상은 URL
  final String contents;

  const InChatEventModel({
    required this.eventId,
    required this.userId,
    required this.inChatEventType,
    required this.timeStamp,
    required this.inChatEventStatus,
    required this.inChatDataType,
    required this.contents,
  });
}
