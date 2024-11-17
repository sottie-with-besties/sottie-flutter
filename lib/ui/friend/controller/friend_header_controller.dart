import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_header_controller.g.dart';

@Riverpod()
final class FriendHeaderController extends _$FriendHeaderController {
  @override
  String build() {
    return '';
  }

  void changeInput(String inputText) {
    state = inputText;
  }
}
