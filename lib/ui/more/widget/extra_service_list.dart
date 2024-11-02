import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ExtraServiceList extends StatelessWidget {
  const ExtraServiceList({
    super.key,
    required this.setStateProfile,
  });

  final void Function(VoidCallback) setStateProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12 * wu),
      child: Column(
        children: [
          _extraService(
            '내 정보 수정',
            () async {
              await context.push(
                  "${CustomRouter.morePath}/${CustomRouter.infoModifyPath}");
              setStateProfile(() {});
            },
          ),
          _extraService(
            '골드 충전',
            () {
              context
                  .push("${CustomRouter.morePath}/${CustomRouter.storePath}");
            },
          ),
          _extraService(
            '이벤트',
            () {
              context
                  .push("${CustomRouter.morePath}/${CustomRouter.eventPath}");
            },
          ),
          _extraService(
            '공지사항',
            () {
              context
                  .push("${CustomRouter.morePath}/${CustomRouter.noticePath}");
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
        ],
      ),
    );
  }
}

Widget _extraService(String serviceTitle, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
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
    ),
  );
}
