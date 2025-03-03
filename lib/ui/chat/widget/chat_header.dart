import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/ui/chat/controller/chat_header_controller.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class ChatHeader extends ConsumerWidget {
  const ChatHeader({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectFunc = ref.read(chatHeaderControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: LocalTextField(
        hint: "제목, 내용, 날짜, 장소...",
        focusNode: focusNode,
        onChanged: (value) {
          selectFunc.changeInput(value!);
        },
      ),
    );
  }
}
