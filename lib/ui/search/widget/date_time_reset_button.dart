import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';

class DateTimeResetButton extends ConsumerWidget {
  const DateTimeResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: OutlinedButton(
        onPressed: () {
          postSettingEntity.dateStart = null;
          postSettingEntity.dateEnd = null;
          postSettingEntity.timeStart = null;
          postSettingEntity.timeEnd = null;
          ref.read(dateTimeResetProvider.notifier).changeResetValue();
        },
        child: const Text("날짜 및 시간 초기화"),
      ),
    );
  }
}
