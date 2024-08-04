import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class DateRangeClass extends StatefulWidget {
  const DateRangeClass({super.key});

  @override
  State<DateRangeClass> createState() => _DateRangeClassState();
}

class _DateRangeClassState extends State<DateRangeClass> {
  String dateString = '날짜 범위 선택';

  @override
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    if (postSettingEntity.dateStart == null ||
        postSettingEntity.dateEnd == null) {
      dateString = "날짜 범위 선택";
    } else {
      dateString =
          "${postSettingEntity.dateStart!.year}년 ${postSettingEntity.dateStart!.month}월 ${postSettingEntity.dateStart!.day}일 ${_intToWeekday(postSettingEntity.dateStart!.weekday)} ~ ${postSettingEntity.dateEnd!.year}년 ${postSettingEntity.dateEnd!.month}월 ${postSettingEntity.dateEnd!.day}일 ${_intToWeekday(postSettingEntity.dateEnd!.weekday)}";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "날짜"),
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
                barrierDismissible: false,
              );

              if (tempDate == null) return;

              postSettingEntity.dateStart = tempDate.start;
              postSettingEntity.dateEnd = tempDate.end;

              dateString =
                  "${postSettingEntity.dateStart!.year}년 ${postSettingEntity.dateStart!.month}월 ${postSettingEntity.dateStart!.day}일 ${_intToWeekday(postSettingEntity.dateStart!.weekday)} ~ ${postSettingEntity.dateEnd!.year}년 ${postSettingEntity.dateEnd!.month}월 ${postSettingEntity.dateEnd!.day}일 ${_intToWeekday(postSettingEntity.dateEnd!.weekday)}";

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

String _intToWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return "월요일";
    case 2:
      return "화요일";
    case 3:
      return "수요일";
    case 4:
      return "목요일";
    case 5:
      return "금요일";
    case 6:
      return "토요일";
    case 7:
      return "일요일";
    default:
      return "요일 정보 없음";
  }
}
