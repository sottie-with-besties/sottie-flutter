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
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    selectedDate = postSettingEntity.date ?? DateTime.now();
    if (postSettingEntity.date == null) {
      dateString = "날짜 범위 선택";
    } else {
      dateString =
          "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 ${_intToWeekday(selectedDate.weekday)}";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "날짜"),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              late DateTime? tempDate;

              tempDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 10),
                initialDate: selectedDate,
                currentDate: selectedDate,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                barrierDismissible: false,
              );

              if (tempDate == null) return;

              selectedDate = tempDate;

              dateString =
                  "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 ${_intToWeekday(selectedDate.weekday)}";

              postSettingEntity.date = selectedDate.copyWith();

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
