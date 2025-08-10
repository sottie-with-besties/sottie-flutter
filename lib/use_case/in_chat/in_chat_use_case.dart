import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_socket_repo_impl.dart';
import 'package:sottie_flutter/repository/in_chat/interface/in_chat_repository_interface.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

sealed class InChatUseCase {
  static final _repo = InChatRepository();
  static final _socketRepo = InChatSocketRepoImpl();

  // 채팅 리스트 가져오기
  static Future<InChatEventListModel> getInChatEventList() async =>
      await _repo.getInChatEventList(roomId: "1231331");

  // 소켓 초기화
  static void initSocket({
    required String roomId,
    required String userId,
    required StompFrameCallback Function(StompFrame frame) callback,
  }) => _socketRepo.initStompClientSocket(roomId: roomId, userId: userId);

  // 소켓 비활성화
  static void deactivateSocket() => _socketRepo.deactivateSocket();

  // 소켓을 통해 데이터 보내기 -> 채팅방 채팅 입력
  static void sendData({
    required int userId,
    required String contents,
    required String messageType,
    required String eventType,
  }) => _socketRepo.sendData(
    userId: userId,
    contents: contents,
    messageType: messageType,
    eventType: eventType,
  );

  // // 이미지 보내기 -> 아직 프로젝트에서 사용하지 않음. (보류)
  // static Future<bool> sendImages({
  //   required String roomId,
  //   required List<String> images,
  // }) async {
  //   try {
  //     final [bool success, List<String> imagePaths] =
  //         await ImageController.selectMultipleImages();
  //
  //     if (success) {
  //       await _repo.sendImage(roomId: roomId, imagePaths: imagePaths);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (_) {
  //     return false;
  //   }
  // }
}
