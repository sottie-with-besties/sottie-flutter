import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';

sealed class InChatEventCacheController {
  // 채팅 데이터 캐시 저장
  // <RoomId, InChatEventListModel Instance>
  static final _inChatEventCache = <String, InChatEventListModel>{};

  // 캐시 가져오기
  // 캐시가 존재하면 이벤트 리스트를 가져오는 작업을 수행하지 않는다.
  static InChatEventListModel? getCache({required String roomId}) =>
      _inChatEventCache[roomId];

  // 캐시 저장
  // 채팅방 첫 입장 시 호출
  static void setCache({
    required String roomId,
    required InChatEventListModel inChatEventListModel,
  }) => _inChatEventCache[roomId] = inChatEventListModel;

  // 포그라운드 상태 동안 도착하는 메세지를 계속 캐시에 담아 둔다.
  static void updateCache({
    required String roomId,
    required InChatEventModel inChatEventModel,
  }) {
    final inChatEventListModel = getCache(roomId: roomId);

    if (inChatEventListModel != null) {
      inChatEventListModel.inChatEventList.add(inChatEventModel);
    }
  }

  //
  // // 채팅방이 종료 되거나 삭제되면 캐시를 삭제한다
  // static void removeCache(String roomId) {
  //   _inChatEventCache.remove(roomId);
  // }
}
