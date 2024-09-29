import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_chat_message_model.freezed.dart';
part 'in_chat_message_model.g.dart';

/// unfrezzed: 소켓으로 데이터를 실시간 받고 변경
/// 앱 첫 실행 후 채팅방 들어가기 이전엔 latestMessage로만 채팅방 표현
/// 채팅방 들어간 후에는 해당 채팅방의 소켓을 끊지 않고(?) Stream 데이터 유지하여 계속 변경(cache)
/// domain에 List<InChatMessageModel> 형태로 entity 남겨두기
@unfreezed
class InChatMessageModel with _$InChatMessageModel {
  factory InChatMessageModel({
    required String id,
    required List<InChatMessageDataModel> inChatMessageData,
  }) = _InChatMessageModel;

  factory InChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$InChatMessageModelFromJson(json);
}

/// userIdWhoSent: 메세지 보낸 유저 id -> 이걸로 나 또는 타인의 메세지 구별 가능
/// sentTime: 유저가 메세지를 전송한 시간(UTC)
/// entity를 List로 받아서 맨 아래쪽 메세지에 시간 표시
@unfreezed
class InChatMessageDataModel with _$InChatMessageDataModel {
  factory InChatMessageDataModel({
    required String id,
    required String userIdWhoSent,
    required String sentTime,
    required List<InChatMessageDataEntityModel> entity,
  }) = _InChatMessageDataModel;

  factory InChatMessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$InChatMessageDataModelFromJson(json);
}

/// entity: 실질적인 데이터 -> 문장, 이미지 및 동영상 url
/// entityType: 데이터의 타입 -> 문장 string, 이미지 및 동영상 mediaUrl
/// 유저가 웹사이트 url을 보냈을 때(?)
@freezed
class InChatMessageDataEntityModel with _$InChatMessageDataEntityModel {
  factory InChatMessageDataEntityModel({
    required String entity,
    required String entityType,
  }) = _InChatMessageDataEntityModel;

  factory InChatMessageDataEntityModel.fromJson(Map<String, dynamic> json) =>
      _$InChatMessageDataEntityModelFromJson(json);
}
