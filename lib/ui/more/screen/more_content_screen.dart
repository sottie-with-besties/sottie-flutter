import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_list.dart';
import 'package:sottie_flutter/ui/more/widget/my_info.dart';
import 'package:sottie_flutter/ui/user/widget/user_radar_chart.dart';

class MoreContentScreen extends StatelessWidget {
  const MoreContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInfo(),
          UserRadarChart(isMe: true),
          ExtraServiceList(),
        ],
      ),
    );
  }
}
