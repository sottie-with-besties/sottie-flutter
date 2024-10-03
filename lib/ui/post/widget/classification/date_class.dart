import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class DateClass extends StatefulWidget {
  const DateClass({super.key});

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
        const ClassificationTitle(title: "날짜"),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              DateTime? tempDate = await showDatePicker(
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
                  "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 ${intToWeekday(selectedDate.weekday)}";

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
