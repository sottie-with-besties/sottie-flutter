import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/category.dart';

class FindFeed extends StatelessWidget {
  const FindFeed({
    super.key,
    required this.category,
    required this.currentMemberCount,
    required this.maxMemberCount,
    required this.title,
    required this.location,
    required this.date,
  });

  final String category;
  final int currentMemberCount;
  final int maxMemberCount;
  final String title;
  final String location;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainSilverColor,
      child: InkWell(
        onTap: () => context.push(CustomRouter.findDetailPath),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 120.h,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.pencil),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(Category.study.name),
                          ],
                        ),
                        Text("$currentMemberCount/$maxMemberCount"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 110.w,
                          height: 70.h,
                          child: const Center(
                            child: Text("썸네일"),
                          ),
                        ),
                        SizedBox(
                          width: 160.w,
                          height: 70.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                location,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                date,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
