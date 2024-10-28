import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_list.dart';
import 'package:sottie_flutter/ui/more/widget/my_info.dart';

class MoreContentScreen extends StatelessWidget {
  const MoreContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyInfo(),
          SizedBox(height: 10 * hu),
          const ExtraServiceList(),
        ],
      ),
    );
  }
}
