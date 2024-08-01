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

    return Center(
      child: Wrap(
        spacing: 20 * wu,
        runSpacing: 20 * hu,
        alignment: WrapAlignment.start,
        children: servicesList
            .map(
              (e) => _ExtraService(
                serviceName: e['name'] as String,
                serviceIcon: e['icon'] as IconData,
                onTap: e['onTap'] as void Function(),
              ),
            )
            .toList(),
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
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 80 * wu,
        height: 100 * hu,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(serviceIcon, size: 26 * hu),
            SizedBox(height: 5 * hu),
            FittedBox(
              child: Text(
                serviceName,
                style: TextStyle(
                  fontSize: 14 * hu,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
