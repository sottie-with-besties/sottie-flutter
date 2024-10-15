import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/domain/user/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/extra_info.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_list.dart';
import 'package:sottie_flutter/ui/more/widget/my_info.dart';

class MoreContentScreen extends StatelessWidget {
  const MoreContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyInfo(),
          SizedBox(height: 10 * hu),
          ExtraInfo(
            subTitle: "나의 매너 온도",
            valueChild: Row(
              children: [
                Text(
                  "${myInfoEntity.mannerPoint}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 12),
                const Text("°C"),
                const SizedBox(width: 5),
              ],
            ),
          ),
          ExtraInfo(
            subTitle: "내 골드",
            valueChild: Row(
              children: [
                Text(
                  "${myInfoEntity.gold}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 10),
                const FaIcon(
                  FontAwesomeIcons.coins,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          SizedBox(height: 20 * hu),
          const ExtraServiceList(),
        ],
      ),
    );
  }
}
