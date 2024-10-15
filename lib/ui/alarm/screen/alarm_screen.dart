import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/alarm/data_source/alarm_dummy.dart';
import 'package:sottie_flutter/data/alarm/model/alarm_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/loading_skeleton.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late Future<List<AlarmModel>> alarmData;

  @override
  void initState() {
    super.initState();
    alarmData = getAlarmDummy();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: alarmData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingSkeleton();
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("알람이 없습니다."),
          );
        } else if (snapshot.hasData) {
          final alarms =
              snapshot.data!.map((e) => _AlarmBox(model: e)).toList();
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SingleChildScrollView(
              child: Column(
                children: alarms,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("에러가 발생했습니다"),
          );
        }
      },
    );
  }
}

class _AlarmBox extends StatelessWidget {
  const _AlarmBox({
    required this.model,
  });

  final AlarmModel model;

  @override
  Widget build(BuildContext context) {
    late IconData alarmIcon;

    if (model.alarmType == AlarmType.event) {
      alarmIcon = FontAwesomeIcons.gift;
    } else if (model.alarmType == AlarmType.chat) {
      alarmIcon = FontAwesomeIcons.comment;
    } else {
      alarmIcon = FontAwesomeIcons.message;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        height: 60 * hu,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 35 * wu,
                    child: Column(
                      children: [
                        FaIcon(
                          size: 24 * hu,
                          alarmIcon,
                        ),
                        SizedBox(height: 3 * hu),
                        Text(
                          model.alarmType.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10 * hu,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: mainGreyColor.withOpacity(0.3),
                    width: 30 * wu,
                    indent: 3,
                    endIndent: 3,
                    thickness: 3,
                  ),
                  SizedBox(
                    width: 160 * wu,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * hu,
                          ),
                        ),
                        SizedBox(height: 5 * hu),
                        Text(
                          model.content,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(model.date),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
