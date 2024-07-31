import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class RemainGold extends StatelessWidget {
  const RemainGold({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 50 * hu,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "내 골드",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 * hu),
          ),
          const Row(
            children: [
              Text(
                "450 ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FaIcon(
                FontAwesomeIcons.coins,
                color: Colors.amber,
              ),
            ],
          )
        ],
      ),
    );
  }
}
