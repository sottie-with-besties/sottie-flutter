import 'package:flutter/cupertino.dart';
import 'package:sottie_flutter/core/rest_api/repository_env.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

final class InChatManagerProvider {
  final StompClient stompClient = StompClient(
    config: StompConfig(
      url: '$devServerIp/chat',
      // 웹소켓 접속 URL
      stompConnectHeaders: <String, String>{
        'accessToken': '12312',
        'roomId': '12312',
        'accessTimeStamp': '123123123',
      },
      // 접속 시 헤더 설정
      onConnect: (StompFrame frame) {},
      // 접속 되었을 때 콜백
      onStompError: (StompFrame frame) {},
      // Stomp 통신 중 에러가 났을 때 콜백
      onDisconnect: (StompFrame frame) {},
      // 접속이 종료되었을 때 콜백
      heartbeatIncoming: const Duration(seconds: 30),
      // heart-beat가 들어오는 주기 설정
      heartbeatOutgoing: const Duration(seconds: 30), // heart-beat가 나가는 주기 설정
    ),
  );

  /// 소켓 초기화
  void initStompClientSocket({required String roomId}) {
    try {
      if (!stompClient.isActive) {
        stompClient.activate();
      }
      stompClient.subscribe(
        destination: '/exchange/sottie.chat.exchange/*.room.$roomId',
        callback: (StompFrame frame) {},
        headers: <String, String>{
          'accessToken': '12312',
          'roomId': '12312',
          'accessTimeStamp': '123123123',
        },
      );
      debugPrint("소켓 연결 성공");
    } catch (_) {
      debugPrint("소켓 연결 실패");
    }
  }

  void deactivateStompClientSocket() {
    if (stompClient.isActive) {
      stompClient.deactivate();
    }
  }
}
