abstract interface class InChatRepoInterface {
  /// 채팅방 첫 입장시 이벤트 리스트 불러오기
  Future<dynamic> getInChatEventList({required String rooId});

  /// 채팅방 과거 데이터 조회하기
  Future<List<dynamic>> getInChatEventListBefore({
    required String roomId,
    required String lastEventId,
  });
}
