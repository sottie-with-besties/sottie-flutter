import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class TimeOption extends StatefulWidget {
  const TimeOption({super.key});

  @override
  State<TimeOption> createState() => _TimeOptionState();
}

class _TimeOptionState extends State<TimeOption> {
  String timeString = '0시 0분';
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OptionTitle(title: "시간"),
        const SizedBox(width: 20),
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

              postOptionsSetting.gatheringDate =
                  (postOptionsSetting.gatheringDate ?? DateTime.now()).copyWith(
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
        ),
      ],
    );
  }
}
