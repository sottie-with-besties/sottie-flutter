import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_header_controller.g.dart';

@Riverpod()
final class FriendHeaderController extends _$FriendHeaderController {
  @override
  String build() {
    return '';
  }

  // All을 체크하면 나머지 카테고리 체크 해제
  void changeInput(String inputText) {
    print('inputText >>>> $inputText');
    state = inputText;
  }
}
