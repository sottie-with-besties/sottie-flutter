import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    const infoStyle = TextStyle(color: mainSilverColor);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (myInfoEntity.profile == null)
                  RandomAvatar(
                    DateTime.now().toIso8601String(),
                    width: 45 * wu,
                    height: 45 * wu,
                  ),
                if (myInfoEntity.profile != null)
                  CircleAvatar(
                    backgroundImage:
                        FileImage(File(myInfoEntity.profile!.path)),
                    radius: 23 * wu,
                  ),
                SizedBox(
                  width: 10 * wu,
                ),
                SizedBox(
                  width: 155 * wu,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myInfoEntity.nickName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16 * hu,
                        ),
                      ),
                      Text(
                        myInfoEntity.email,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OutlinedButton(
                onPressed: () async {
                  await context.push(
                      "${CustomRouter.morePath}/${CustomRouter.infoModifyPath}");
                  setState(() {});
                },
                child: const Text(
                  "수정",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
        SizedBox(
          height: 10 * hu,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: const Color(0xdda0522d),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 30 * hu,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                myInfoEntity.birthYear,
                style: infoStyle,
              ),
              const VerticalDivider(
                indent: 10,
                endIndent: 10,
              ),
              Text(
                myInfoEntity.gender.value,
                style: infoStyle,
              ),
              const VerticalDivider(
                indent: 10,
                endIndent: 10,
              ),
              Text(
                myInfoEntity.name,
                style: infoStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
