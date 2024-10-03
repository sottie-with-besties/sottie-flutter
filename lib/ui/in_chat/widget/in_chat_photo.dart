import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';

class InChatPhoto extends StatelessWidget {
  const InChatPhoto({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          CustomRouter.photoMagnificationPath,
          extra: {
            'imageUrl':
                'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png'
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: const Center(
          child: Text("사진"),
        ),
      ),
    );
  }
}
