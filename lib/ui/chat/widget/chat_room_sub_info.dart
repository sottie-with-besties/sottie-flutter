import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      fontSize: 11.sp,
      color: const Color(0x64000000),
      fontWeight: FontWeight.bold,
    );

    final numOfMsg = notReadMsg > 999 ? '+999' : notReadMsg.toString();

    return SizedBox(
      width: 60.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                numOfMember.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' 명',
                style: ts1,
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            latestTime,
            style: ts1,
          ),
          SizedBox(
            height: 3.h,
          ),
          if (notReadMsg != 0)
            Transform.translate(
              offset: const Offset(-5, 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 45.w,
                height: 20.h,
                child: Center(
                  child: Text(
                    numOfMsg,
                    style: TextStyle(
                      color: mainSilverColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
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
