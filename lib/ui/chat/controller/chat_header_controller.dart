import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_header_controller.g.dart';

@Riverpod()
final class ChatHeaderController extends _$ChatHeaderController {
  @override
  String build() {
    return '';
  }

  void changeInput(String inputText) {
    state = inputText;
  }
}
