import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class NumOfMemberClass extends StatelessWidget {
  const NumOfMemberClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClassificationTitle(title: "인원 수"),
        SizedBox(width: 20),
        _NumOfMemberSelector(),
      ],
    );
  }
}

class _NumOfMemberSelector extends ConsumerWidget {
  const _NumOfMemberSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = List.generate(9, (index) => index + 2);

    return DropdownMenu(
      initialSelection: postSettingEntity.numOfMember,
      menuHeight: 200,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownMenuEntries: entries
          .map((val) => DropdownMenuEntry(value: val, label: val.toString()))
          .toList(),
      onSelected: (val) {
        postSettingEntity.numOfMember = val!;
        ref
            .read(numOfMemberProvider.notifier)
            .changeNumOfMember(postSettingEntity.numOfMember);
      },
    );
  }
}
