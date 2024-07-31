import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/more/widget/my_info.dart';
import 'package:sottie_flutter/ui/more/widget/remain_gold.dart';

class MoreContentScreen extends StatelessWidget {
  const MoreContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInfo(),
          SizedBox(height: 15),
          RemainGold(),
        ],
      ),
    );
  }
}
