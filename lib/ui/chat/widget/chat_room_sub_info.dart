import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

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
    final ts1 = TextStyle(
      fontSize: 8 * hu,
      color: const Color(0x64000000),
      fontWeight: FontWeight.bold,
    );

    final numOfMsg = notReadMsg > 999 ? '+999' : notReadMsg.toString();

    return SizedBox(
      width: 50 * wu,
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
                  fontSize: 12 * hu,
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
                width: 40 * wu,
                height: 20 * hu,
                child: Center(
                  child: Text(
                    numOfMsg,
                    style: TextStyle(
                      color: mainSilverColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10 * hu,
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
