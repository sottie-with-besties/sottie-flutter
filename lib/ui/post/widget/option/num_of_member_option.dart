import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class NumOfMemberOption extends StatelessWidget {
  const NumOfMemberOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OptionTitle(title: "인원 수"),
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
    final entries = <int>[0, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return DropdownMenu(
      initialSelection: postSettingEntity.peopleNum,
      menuHeight: 200,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownMenuEntries: entries
          .map((val) => DropdownMenuEntry(
              value: val, label: val == 0 ? '설정' : val.toString()))
          .toList(),
      onSelected: (val) {
        postSettingEntity.peopleNum = val!;
        ref
            .read(numOfMemberProvider.notifier)
            .changeNumOfMember(postSettingEntity.peopleNum);
      },
    );
  }
}
