import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';
import 'package:sottie_flutter/ui/search/controller/date_time_reset.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TimeRangeClass extends ConsumerStatefulWidget {
  const TimeRangeClass({super.key});

  @override
  ConsumerState<TimeRangeClass> createState() => _TimeRangeClassState();
}

class _TimeRangeClassState extends ConsumerState<TimeRangeClass> {
  String timeString = '시간 범위 선택';

  void makeTimeString() {
    if (postSettingEntity.timeStart == null ||
        postSettingEntity.timeEnd == null) {
      timeString = "시간 범위 선택";
      return;
    }

    int startHour = postSettingEntity.timeStart!.hour;
    String startTemp = startHour < 12 ? "AM" : "PM";

    startTemp == "PM"
        ? startHour > 12
            ? startHour -= 12
            : null
        : null;

    int endHour = postSettingEntity.timeEnd!.hour;
    String endTemp = endHour < 12 ? "AM" : "PM";

    endTemp == "PM"
        ? endHour > 12
            ? endHour -= 12
            : null
        : null;

    timeString =
        "$startTemp $startHour시 ${postSettingEntity.timeStart!.minute}분 ~ $endTemp $endHour시 ${postSettingEntity.timeEnd!.minute}분";
  }

  @override
  Widget build(BuildContext context) {
    // 날짜 및 시간 초기화 버튼 눌리는거 인지 하는 용도
    ref.watch(dateTimeResetProvider);
    makeTimeString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "시간"),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              TimeRange? tempTime = await showTimeRangePicker(
                context: context,
                start: postSettingEntity.timeStart ??
                    const TimeOfDay(hour: 0, minute: 0),
                end: postSettingEntity.timeEnd ??
                    const TimeOfDay(hour: 0, minute: 0),
                barrierDismissible: false,
                interval: const Duration(minutes: 30),
                strokeWidth: 24,
                ticks: 24,
                ticksWidth: 3,
                ticksColor: Colors.black38,
                strokeColor: Colors.deepPurple.shade200,
                snap: true,
                labels: [
                  "12 am",
                  "3 am",
                  "6 am",
                  "9 am",
                  "12 pm",
                  "3 pm",
                  "6 pm",
                  "9 pm"
                ].asMap().entries.map((e) {
                  return ClockLabel.fromIndex(
                      idx: e.key, length: 8, text: e.value);
                }).toList(),
                labelOffset: -30,
                labelStyle: const TextStyle(
                    fontSize: 16,
                    color: mainGreyColor,
                    fontWeight: FontWeight.bold),
              );

              if (tempTime == null) return;

              postSettingEntity.timeStart = tempTime.startTime;
              postSettingEntity.timeEnd = tempTime.endTime;

              makeTimeString();
              setState(() {});
            },
            child: Text(
              timeString,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
