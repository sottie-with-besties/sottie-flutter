import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_repo_impl_dev.dart';

abstract interface class InChatRepository {
  factory InChatRepository() {
    return InChatRepoImplDev();
  }

  /// 채팅방 첫 입장시 이벤트 리스트 불러오기
  Future<InChatEventListModel> getInChatEventList({required String roomId});

  /// 채팅방 과거 데이터 조회하기
  Future<List<InChatEventModel>> getInChatEventListBefore({
    required String roomId,
    required String lastEventId,
  });
}
