import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.date,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.latestTime,
    required this.notReadMsg,
  });

  final String date;
  final String location;
  final String chatTitle;
  final String latestMsg;
  final String latestTime;
  final int notReadMsg;

  @override
  Widget build(BuildContext context) {
    final numOfMsg = notReadMsg > 999 ? '999+' : notReadMsg.toString();

    return SizedBox(
      width: 220 * wu,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200 * wu,
            child: Text(
              overflow: TextOverflow.ellipsis,
              chatTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16 * hu,
              ),
            ),
          ),
          SizedBox(height: 3 * hu),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150 * wu,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  latestMsg,
                  style: TextStyle(
                    fontSize: 10 * hu,
                    fontWeight: FontWeight.bold,
                    color: const Color(0x84000000),
                  ),
                ),
              ),
              SizedBox(
                width: 50 * wu,
                child: Text(
                  _renderLatestTime(latestTime),
                  style: TextStyle(
                    fontSize: 8 * hu,
                    color: const Color(0x64000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3 * hu),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    date,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    location,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (notReadMsg != 0)
                Padding(
                  padding: EdgeInsets.only(right: 12 * wu),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 40 * wu,
                    height: 20 * hu,
                    padding: EdgeInsets.all(3 * hu),
                    child: FittedBox(
                      child: Text(
                        numOfMsg,
                        style: const TextStyle(
                          color: mainSilverColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

String _renderLatestTime(String utcTimeString) {
  final now = DateTime.now();

  final latestTime = DateTime.parse(utcTimeString);
  final timeDifference = now.difference(latestTime);

  late String customTime;

  if (latestTime.year != now.year) {
    customTime = '${latestTime.year}년 ${latestTime.month}월 ${latestTime.day}일';
  } else if (timeDifference.inDays > 0) {
    customTime = '${latestTime.month}월 ${latestTime.day}일';
  } else {
    final dayString = latestTime.hour < 12 ? '오전' : '오후';
    final hour =
        latestTime.hour > 12 ? '${latestTime.hour - 12}' : '${latestTime.hour}';

    customTime =
        '$dayString $hour : ${latestTime.minute.toString().padLeft(2, '0')}';
  }

  return customTime;
}
