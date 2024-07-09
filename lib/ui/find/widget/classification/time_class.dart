import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class TimeClass extends StatefulWidget {
  const TimeClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<TimeClass> createState() => _TimeClassState();
}

class _TimeClassState extends State<TimeClass> {
  String timeString = '시간 선택';
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "시간",
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
              late TimeOfDay? tempTime;

              tempTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                barrierDismissible: false,
              );

              if (tempTime == null) return;

              selectedTime = tempTime;

              widget.classification.date =
                  (widget.classification.date ?? DateTime.now()).copyWith(
                hour: selectedTime.hour,
                minute: selectedTime.minute,
              );

              String temp = selectedTime.hour < 12 ? "AM" : "PM";
              int hour = selectedTime.hour;

              temp == "PM"
                  ? hour > 12
                      ? hour -= 12
                      : null
                  : null;

              timeString = "$temp $hour시 ${selectedTime.minute}분";
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
