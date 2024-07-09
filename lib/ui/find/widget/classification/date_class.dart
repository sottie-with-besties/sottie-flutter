import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class DateClass extends StatefulWidget {
  const DateClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<DateClass> createState() => _DateClassState();
}

class _DateClassState extends State<DateClass> {
  String dateString = '날짜 선택';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "날짜",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
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
                  "${tempDate.year}년 ${tempDate.month}월 ${tempDate.day}일 ${_intToWeekday(tempDate.weekday)}";

              widget.classification.date = selectedDate.copyWith();

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
