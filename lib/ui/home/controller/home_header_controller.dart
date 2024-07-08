import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/classification/model/category.dart';

part 'home_header_controller.g.dart';

@Riverpod()
final class HomeHeaderController extends _$HomeHeaderController {
  @override
  List<bool> build() {
    return List<bool>.generate(
      Category.lengthOfCategory(),
      (index) => index == 0 ? true : false,
    );
  }

  // All을 체크하면 나머지 카테고리 체크 해제
  void checkAll() {
    final tempState = state;
    tempState[0] = true;
    for (int i = 1; i < tempState.length; i++) {
      tempState[i] = false;
    }

    state = List.from(tempState);
  }

  // All이 아닌 나머지 카테고리 하나라도 체크되어 있으면 All 체크 해제
  void checkAnyExceptAll(int index, bool check) {
    final tempState = state;
    tempState[0] = false;
    tempState[index] = check;

    state = List.from(tempState);
  }
}
