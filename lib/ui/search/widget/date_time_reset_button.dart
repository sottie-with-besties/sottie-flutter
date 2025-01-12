import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';

class DateTimeResetButton extends ConsumerWidget {
  const DateTimeResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          postOptions.dateTimeRange = null;
          postOptions.timeStart = null;
          postOptions.timeEnd = null;
          ref.read(dateTimeResetProvider.notifier).changeResetValue();
        },
        child: const Text("날짜 및 시간 초기화"),
      ),
    );
  }
}
