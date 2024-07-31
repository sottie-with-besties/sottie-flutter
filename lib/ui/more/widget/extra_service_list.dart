import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service.dart';

class ExtraServiceList extends StatelessWidget {
  const ExtraServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20 * wu,
        runSpacing: 20 * hu,
        alignment: WrapAlignment.start,
        children: _servicesList
            .map(
              (e) => ExtraService(
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

final _servicesList = [
  {
    'name': "상점",
    'icon': FontAwesomeIcons.store,
    'onTap': () {log("상점");},
  },
  {
    'name': "이벤트",
    'icon': FontAwesomeIcons.gifts,
    'onTap': () {},
  },
  {
    'name': "고객센터",
    'icon': FontAwesomeIcons.phoneVolume,
    'onTap': () {},
  },
  {
    'name': "환경설정",
    'icon': FontAwesomeIcons.gear,
    'onTap': () {},
  },
  {
    'name': "도움말",
    'icon': FontAwesomeIcons.book,
    'onTap': () {},
  },
];
