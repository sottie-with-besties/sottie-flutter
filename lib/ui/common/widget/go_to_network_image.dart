import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';

class GoToNetworkImage extends StatelessWidget {
  const GoToNetworkImage({
    super.key,
    required this.imageUrl,
    required this.child,
  });

  final String imageUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          CustomRouter.photoMagnificationPath,
          extra: {
            'imageUrl': imageUrl,
          },
        );
      },
      child: child,
    );
  }
}
