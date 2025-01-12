import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class DateOption extends StatefulWidget {
  const DateOption({super.key});

  @override
  State<DateOption> createState() => _DateOptionState();
}

class _DateOptionState extends State<DateOption> {
  String dateString = '날짜 선택';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OptionTitle(title: "날짜"),
        const SizedBox(width: 20),
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
                  "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일 ${convertIntToWeekday(selectedDate.weekday)}";

              postOptions.gatheringDate = selectedDate.copyWith();

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
