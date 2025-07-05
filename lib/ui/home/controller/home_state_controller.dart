import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state_controller.g.dart';

enum HomePostState {
  // 최신 모집글, 추천 모집글 보여주는 상태
  home,

  // 검색 결과 보여주는 상태
  search,
}

@Riverpod(keepAlive: true)
final class HomeStateController extends _$HomeStateController {
  @override
  HomePostState build() {
    return HomePostState.home;
  }

  // 홈 스크린 상태 변경
  void changeHomeState(HomePostState homePostState) => state = homePostState;
}
