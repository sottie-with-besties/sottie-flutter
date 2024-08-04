import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TimeRangeClass extends StatefulWidget {
  const TimeRangeClass({super.key});

  @override
  State<TimeRangeClass> createState() => _TimeRangeClassState();
}

class _TimeRangeClassState extends State<TimeRangeClass> {
  String timeString = '시간 범위 선택';

  void makeTimeString() {
    if (postSettingEntity.timeStart == null ||
        postSettingEntity.timeEnd == null) {
      timeString == "시간 범위 선택";
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
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    makeTimeString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                ticksWidth: 5,
                ticksColor: Colors.black38,
                strokeColor: Colors.deepPurple.shade200,
                snap: true,
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
