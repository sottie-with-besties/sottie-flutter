import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';
import 'package:sottie_flutter/ui/friend/controller/friend_header_controller.dart';

class FriendHeader extends ConsumerWidget {
  const FriendHeader({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectFunc = ref.read(friendHeaderControllerProvider.notifier);

    return LocalTextField(
      hint: "이름, 연락처...",
      focusNode: focusNode,
      onChanged: (value) {
        selectFunc.changeInput(value!);
      },
    );
  }
}
