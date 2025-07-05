import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

final class InChatSocketRepoImpl {
  StompClient? _stompClient;

  // 소켓 구독 취소
  // subscribe 함수를 호출 시 unSubscribe 함수를 반환한다.
  Function? unSubscribeFn;

  // 소켓 초기화
  void initStompClientSocket({
    required String roomId,
    required String userId,
    required StompFrameCallback Function(StompFrame frame) callback,
  }) {
    try {
      _stompClient = StompClient(
        config: StompConfig(
          // 웹소켓 접속 URL
          url: 'ws://43.203.8.220:8080/chat',
          // 접속 시 헤더 설정
          stompConnectHeaders: <String, String>{'userId': userId},
          // 접속 되었을 때 콜백
          onConnect: (StompFrame frame) {
            try {
              log("onConnect");

              unSubscribeFn = _stompClient!.subscribe(
                destination: '/exchange/sottie.chat.exchange/*.room.$roomId',
                headers: <String, String>{},
                callback: callback,
              );
            } catch (e) {
              log(e.toString());
            }
          },
          // Stomp 통신 중 에러가 났을 때 콜백
          onStompError: (StompFrame frame) {},
          // 접속이 종료되었을 때 콜백
          onDisconnect: (StompFrame frame) {},
          // heart-beat가 들어오는 주기 설정
          heartbeatIncoming: const Duration(seconds: 30),
          // heart-beat가 나가는 주기 설정
          heartbeatOutgoing: const Duration(seconds: 30),
        ),
      )..activate();

      debugPrint("소켓 연결 성공");
    } catch (e) {
      log(e.toString());
      debugPrint("소켓 연결 실패");
    }
  }

  // 소켓 비활성화
  void deactivateSocket() {
    if (_stompClient!.isActive) {
      _stompClient!.deactivate();
      log("deactivate");
    }
  }

  void sendData({
    required int userId,
    required String contents,
    required String messageType,
    required String eventType,
  }) {
    if (_canSendData()) {
      _stompClient!.send(
        destination: "/pub/chat.send.$userId",
        body: jsonEncode({
          "userId": userId,
          "contents": contents,
          "messageType": messageType,
          "eventType": eventType,
        }),
        headers: {'userId': userId.toString()},
      );
    }
  }

  // 소켓이 잘 연결되어있는지 확인
  bool _canSendData() => _stompClient != null && _stompClient!.isActive;
}
