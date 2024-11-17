import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';

class DateRangeOption extends ConsumerStatefulWidget {
  const DateRangeOption({super.key});

  @override
  ConsumerState<DateRangeOption> createState() => _DateRangeClassState();
}

class _DateRangeClassState extends ConsumerState<DateRangeOption> {
  String dateString = '날짜 범위 선택';

  void makeDateString() {
    if (postSettingEntity.dateStart == null ||
        postSettingEntity.dateEnd == null) {
      dateString = "날짜 범위 선택";
    } else {
      dateString =
          "${postSettingEntity.dateStart!.year}년 ${postSettingEntity.dateStart!.month}월 ${postSettingEntity.dateStart!.day}일 ${convertIntToWeekday(postSettingEntity.dateStart!.weekday)} ~ ${postSettingEntity.dateEnd!.year}년 ${postSettingEntity.dateEnd!.month}월 ${postSettingEntity.dateEnd!.day}일 ${convertIntToWeekday(postSettingEntity.dateEnd!.weekday)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(dateTimeResetProvider);
    makeDateString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OptionTitle(title: "날짜"),
        const SizedBox(width: 20),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              DateTimeRange? tempDate = await showDateRangePicker(
                context: context,
                initialDateRange: DateTimeRange(
                    start: postSettingEntity.dateStart ?? DateTime.now(),
                    end: postSettingEntity.dateEnd ?? DateTime.now()),
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 10),
                cancelText: "취소",
                confirmText: "저장하기",
                saveText: "저장하기",
                barrierDismissible: false,
              );

              if (tempDate == null) return;

              postSettingEntity.dateStart = tempDate.start;
              postSettingEntity.dateEnd = tempDate.end;

              makeDateString();
              setState(() {});
            },
            child: Text(
              dateString,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
