import 'package:flutter/cupertino.dart';
import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

final class InChatSocketUseCase {
  static final InChatSocketUseCase _instance = InChatSocketUseCase._();

  factory InChatSocketUseCase() => _instance;

  InChatSocketUseCase._();

  /// STOMP 웹소켓 생성
  final StompClient stompClient = StompClient(
    config: StompConfig(
      url: '${ApiEnv.devHost}/chat',
      // todo: url 점검
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

  /// 소켓 구독 취소
  /// subscribe 함수를 호출 시 unSubscribe 함수를 반환한다.
  Function? unSubscribeFn;

  /// 소켓 초기화
  void initStompClientSocket({required String roomId}) {
    try {
      if (!stompClient.isActive) {
        stompClient.activate();
      }
      unSubscribeFn = stompClient.subscribe(
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

  /// 소켓 구독 취소
  void unSubscribe() {
    if (unSubscribeFn != null) {
      unSubscribeFn!();
      unSubscribeFn = null;
    }
  }

  /// 소켓 비활성화
  void deactivateStompClientSocket() {
    if (stompClient.isActive) {
      stompClient.deactivate();
    }
  }

  /// 소켓이 잘 연결되어있는지 확인
  bool canSendData() {
    return stompClient.isActive && stompClient.connected;
  }
}
