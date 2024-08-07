import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

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
                // const 선언을 붙이면 프로필 사진 변경이 즉각 반영되지 않습니다.
                UserProfile(
                  avatarId: "abc",
                  randomAvatarSize: 45,
                  profileAvatarSize: 23,
                  profileUrl: myInfoEntity.profile?.path,
                  me: true,
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
