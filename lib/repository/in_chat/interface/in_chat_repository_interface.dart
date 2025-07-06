import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/in_chat/implements/in_chat_repo_impl_dummy.dart';

abstract interface class InChatRepository {
  factory InChatRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => InChatRepoImplDummy(),
      ServerEnvironment.dev => InChatRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  // 채팅방 첫 입장시 이벤트 리스트 불러오기
  Future<InChatEventListModel> getInChatEventList({required String roomId});

  // 채팅방 과거 데이터 조회하기
  Future<List<InChatEventModel>> getInChatEventListBefore({
    required String roomId,
    required String lastEventId,
  });

  // 채팅방에 이미지 전송하기
  Future<void> sendImage({
    required String roomId,
    required List<String> imagePaths,
  });
}
