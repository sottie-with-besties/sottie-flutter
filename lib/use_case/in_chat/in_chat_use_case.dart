import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_socket_repo_impl.dart';
import 'package:sottie_flutter/repository/in_chat/interface/in_chat_repository_interface.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

sealed class InChatUseCase {
  static final _repo = InChatRepository();
  static final _socketRepo = InChatSocketRepoImpl();

  static Future<InChatEventListModel> getInChatEventList() async {
    final inChatEventListModel = await _repo.getInChatEventList(
      roomId: "1231331",
    );

    return inChatEventListModel;
  }

  static void initSocket({
    required String roomId,
    required String userId,
    required StompFrameCallback Function(StompFrame frame) callback,
  }) {
    _socketRepo.initStompClientSocket(
      roomId: roomId,
      userId: userId,
      callback: callback,
    );
  }

  static void deactivateSocket() {
    _socketRepo.deactivateSocket();
  }

  static void sendData({
    required int userId,
    required String contents,
    required String messageType,
    required String eventType,
  }) {
    _socketRepo.sendData(
      userId: userId,
      contents: contents,
      messageType: messageType,
      eventType: eventType,
    );
  }
}
