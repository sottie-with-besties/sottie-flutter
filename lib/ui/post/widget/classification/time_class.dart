import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class TimeClass extends StatefulWidget {
  const TimeClass({super.key});

  @override
  State<TimeClass> createState() => _TimeClassState();
}

class _TimeClassState extends State<TimeClass> {
  String timeString = '0시 0분';
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);

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
              TimeOfDay? tempTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                barrierDismissible: false,
              );

              if (tempTime == null) return;

              selectedTime = tempTime;

              postSettingEntity.date =
                  (postSettingEntity.date ?? DateTime.now()).copyWith(
                hour: selectedTime.hour,
                minute: selectedTime.minute,
              );

              int hour = selectedTime.hour;
              String temp = selectedTime.hour < 12 ? "AM" : "PM";

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
