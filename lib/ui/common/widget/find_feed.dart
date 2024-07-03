import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindFeed extends StatelessWidget {
  const FindFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120.h,
          width: 320.w,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
