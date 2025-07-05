import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_chat_event_state_controller.g.dart';

enum InChatEventState {
  // 첫 로딩
  firstLoading,

  // 이벤트 가져오는 중
  loading,

  // 데이터 성공적으로 가져옴
  fetch,

  // 에러 발생
  error,
}

@Riverpod()
final class InChatEventStateController extends _$InChatEventStateController {
  @override
  InChatEventState build() {
    return InChatEventState.firstLoading;
  }

  // 홈 스크린 상태 변경
  void changeHomeState(InChatEventState inChatEventState) =>
      state = inChatEventState;
}
