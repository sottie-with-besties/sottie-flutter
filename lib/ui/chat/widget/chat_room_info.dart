import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.date,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.numOfMember,
  });

  final String date;
  final String location;
  final String chatTitle;
  final String latestMsg;
  final int numOfMember;

  @override
  Widget build(BuildContext context) {
    final ts1 = TextStyle(
      fontSize: 11.sp,
      color: const Color(0x64000000),
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
      width: 210.w,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      chatTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
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
                      SizedBox(
                        width: 20.w,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      latestMsg,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0x84000000),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "11:00",
                        style: ts1,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  date,
                ),
              ),
              SizedBox(
                width: 180.w,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  location,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
