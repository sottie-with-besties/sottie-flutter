import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

class FriendInfo extends StatelessWidget {
  const FriendInfo({
    super.key,
    required this.friendName,
    required this.stateMsg,
  });

  final String friendName;
  final String stateMsg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
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
                      friendName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
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
                      stateMsg,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0x84000000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
