import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';

class DateRangeOption extends ConsumerStatefulWidget {
  const DateRangeOption({super.key});

  @override
  ConsumerState<DateRangeOption> createState() => _DateRangeClassState();
}

class _DateRangeClassState extends ConsumerState<DateRangeOption> {
  String dateString = '날짜 범위 선택';

  void makeDateString() {
    postOptions.dateTimeRange == null
        ? dateString = "날짜 범위 선택"
        : dateString =
            "${postOptions.dateTimeRange!.start.year}년 ${postOptions.dateTimeRange!.start.month}월 ${postOptions.dateTimeRange!.start.day}일 ${convertIntToWeekday(postOptions.dateTimeRange!.start.weekday)} ~ ${postOptions.dateTimeRange!.end.year}년 ${postOptions.dateTimeRange!.end.month}월 ${postOptions.dateTimeRange!.end.day}일 ${convertIntToWeekday(postOptions.dateTimeRange!.end.weekday)}";
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(dateTimeResetProvider);
    makeDateString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(minimumSize: const Size(0, 50)),
          onPressed: () async {
            DateTimeRange? tempDateTimeRange = await showDateRangePicker(
              context: context,
              initialDateRange:
                  postOptions.dateTimeRange ??
                  DateTimeRange(start: DateTime.now(), end: DateTime.now()),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
              cancelText: "취소",
              confirmText: "저장하기",
              saveText: "저장하기",
              barrierDismissible: false,
            );

            if (tempDateTimeRange == null) return;

            postOptions.dateTimeRange = tempDateTimeRange;

            makeDateString();
            setState(() {});
          },
          child: Text(dateString, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
