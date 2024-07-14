import 'package:flutter/material.dart';

import '../../../core/constant/custom_colors.dart';

class ChatRoomSubInfo extends StatelessWidget {
  const ChatRoomSubInfo({
    super.key,
    required this.numOfMember,
    required this.latestTime,
    required this.notReadMsg,
  });

  final int numOfMember;
  final String latestTime;
  final int notReadMsg;

  @override
  Widget build(BuildContext context) {
    final ts1 = const TextStyle(
      fontSize: 10,
      color: const Color(0x64000000),
      fontWeight: FontWeight.bold,
    );

    final numOfMsg = notReadMsg > 999 ? '+999' : notReadMsg.toString();

    return SizedBox(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                numOfMember.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' 명',
                style: ts1,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            latestTime,
            style: ts1,
          ),
          const SizedBox(
            height: 3,
          ),
          if (notReadMsg != 0)
            Transform.translate(
              offset: const Offset(-5, 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 50,
                height: 20,
                child: Center(
                  child: Text(
                    numOfMsg,
                    style: const TextStyle(
                      color: mainSilverColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
