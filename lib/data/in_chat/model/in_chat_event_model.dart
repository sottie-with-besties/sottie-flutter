import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'in_chat_event_model.freezed.dart';
part 'in_chat_event_model.g.dart';

@freezed
sealed class InChatEventListModel with _$InChatEventListModel {
  factory InChatEventListModel({
    required String roomId,

    required List<UserModel> userList,

    required List<InChatEventModel> inChatEventList,
  }) = _InChatEventListModel;

  factory InChatEventListModel.fromJson(Map<String, dynamic> json) =>
      _$InChatEventListModelFromJson(json);
}

@freezed
sealed class InChatEventModel with _$InChatEventModel {
  factory InChatEventModel({
    required String eventId,

    required int userId,

    required String inChatEventType,

    required DateTime timeStamp,

    required String inChatEventStatus,

    required InChatDataModel inChatData,
  }) = _InChatEventModel;

  factory InChatEventModel.fromJson(Map<String, dynamic> json) =>
      _$InChatEventModelFromJson(json);
}

@freezed
sealed class InChatDataModel with _$InChatDataModel {
  factory InChatDataModel({
    required String dataId,

    required String inChatDataType,

    required String contents,
  }) = _InChatDataModel;

  factory InChatDataModel.fromJson(Map<String, dynamic> json) =>
      _$InChatDataModelFromJson(json);
}
