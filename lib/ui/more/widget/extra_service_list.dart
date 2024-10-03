import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ExtraServiceList extends StatelessWidget {
  const ExtraServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesList = [
      {
        'name': "상점",
        'icon': FontAwesomeIcons.store,
        'onTap': () {
          context.push("${CustomRouter.morePath}/${CustomRouter.storePath}");
        },
      },
      {
        'name': "이벤트",
        'icon': FontAwesomeIcons.gifts,
        'onTap': () {
          context.push("${CustomRouter.morePath}/${CustomRouter.eventPath}");
        },
      },
      {
        'name': "공지사항",
        'icon': FontAwesomeIcons.clipboard,
        'onTap': () {
          context.push("${CustomRouter.morePath}/${CustomRouter.noticePath}");
        },
      },
      {
        'name': "고객센터",
        'icon': FontAwesomeIcons.phoneVolume,
        'onTap': () {
          context.push(
              "${CustomRouter.morePath}/${CustomRouter.customerServicePath}");
        },
      },
      {
        'name': "환경설정",
        'icon': FontAwesomeIcons.gear,
        'onTap': () {
          context.push("${CustomRouter.morePath}/${CustomRouter.settingPath}");
        },
      },
      {
        'name': "도움말",
        'icon': FontAwesomeIcons.book,
        'onTap': () {
          context.push("${CustomRouter.morePath}/${CustomRouter.guidePath}");
        },
      },
    ];

    return SizedBox(
      height: 200 * hu,
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemBuilder: (_, index) => _ExtraService(
          serviceName: servicesList[index]['name'] as String,
          serviceIcon: servicesList[index]['icon'] as IconData,
          onTap: servicesList[index]['onTap'] as void Function(),
        ),
        itemCount: 6, // 예시로 8개의 아이템을 생성합니다.
      ),
    );
  }
}

class _ExtraService extends StatelessWidget {
  const _ExtraService({
    required this.serviceName,
    required this.serviceIcon,
    required this.onTap,
  });

  final String serviceName;
  final IconData serviceIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0 * hu),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(serviceIcon),
                SizedBox(height: 5 * hu),
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
