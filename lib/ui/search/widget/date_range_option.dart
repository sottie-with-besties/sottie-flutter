import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';

class DateRangeOption extends ConsumerStatefulWidget {
  const DateRangeOption({super.key});

  @override
  ConsumerState<DateRangeOption> createState() => _DateRangeClassState();
}

class _DateRangeClassState extends ConsumerState<DateRangeOption> {
  String dateString = '날짜 범위 선택';

  void makeDateString() {
    postOptionsSetting.dateTimeRange == null
        ? dateString = "날짜 범위 선택"
        : dateString =
            "${postOptionsSetting.dateTimeRange!.start.year}년 ${postOptionsSetting.dateTimeRange!.start.month}월 ${postOptionsSetting.dateTimeRange!.start.day}일 ${convertIntToWeekday(postOptionsSetting.dateTimeRange!.start.weekday)} ~ ${postOptionsSetting.dateTimeRange!.end.year}년 ${postOptionsSetting.dateTimeRange!.end.month}월 ${postOptionsSetting.dateTimeRange!.end.day}일 ${convertIntToWeekday(postOptionsSetting.dateTimeRange!.end.weekday)}";
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
                  postOptionsSetting.dateTimeRange ??
                  DateTimeRange(start: DateTime.now(), end: DateTime.now()),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
              cancelText: "취소",
              confirmText: "저장하기",
              saveText: "저장하기",
              barrierDismissible: false,
            );

            if (tempDateTimeRange == null) return;

            postOptionsSetting.dateTimeRange = tempDateTimeRange;

            makeDateString();
            setState(() {});
          },
          child: Text(dateString, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
