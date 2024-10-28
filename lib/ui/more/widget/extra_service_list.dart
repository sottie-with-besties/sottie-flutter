import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ExtraServiceList extends StatelessWidget {
  const ExtraServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _extraService(
          '상점',
          () {
            context.push("${CustomRouter.morePath}/${CustomRouter.storePath}");
          },
        ),
        _extraService(
          '이벤트',
          () {
            context.push("${CustomRouter.morePath}/${CustomRouter.eventPath}");
          },
        ),
        _extraService(
          '공지사항',
          () {
            context.push("${CustomRouter.morePath}/${CustomRouter.noticePath}");
          },
        ),
        _extraService(
          '고객센터',
          () {
            context.push(
                "${CustomRouter.morePath}/${CustomRouter.customerServicePath}");
          },
        ),
        _extraService(
          '환경설정',
          () {
            context
                .push("${CustomRouter.morePath}/${CustomRouter.settingPath}");
          },
        ),
        _extraService(
          '도움말',
          () {
            context.push("${CustomRouter.morePath}/${CustomRouter.guidePath}");
          },
        ),
      ],
    );
  }
}

Widget _extraService(String serviceTitle, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: mainBlackColor,
          ),
          child: Text(
            serviceTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 * hu),
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: mainBlackColor,
        ),
      ],
    ),
  );
}
