import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';

sealed class InChatEventCacheController {
  /// 채팅 데이터 캐시 저장
  /// <RoomId, InChatEventListModel Instance>
  static final _inChatEventCache = <String, InChatEventListModel>{};

  /// 캐시 가져오기
  /// 캐시가 존재하면 api 요청을 하지 않는다
  static InChatEventListModel? getCache(String roomId) {
    return _inChatEventCache[roomId];
  }

  /// 포그라운드 상태 동안 도착하는 메세지를 계속 캐시에 담아둔다.
  static void updateCache(InChatEventListModel inChatEventListModel) {
    _inChatEventCache[inChatEventListModel.roomId] = inChatEventListModel;
  }

  /// 채팅방이 종료 되거나 삭제되면 캐시를 삭제한다
  static void removeCache(String roomId) {
    _inChatEventCache.remove(roomId);
  }
}
