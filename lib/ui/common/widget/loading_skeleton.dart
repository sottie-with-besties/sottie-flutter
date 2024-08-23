import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          _RenderBone(),
          _RenderBone(),
          _RenderBone(),
          _RenderBone(),
          _RenderBone(),
          _RenderBone(),
        ],
      ),
    );
  }
}

class _RenderBone extends StatelessWidget {
  const _RenderBone();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: Colors.black12,
          highlightColor: mainSilverColor,
        ),
        ignoreContainers: true,
        enabled: true,
        child: Card(
          child: ListTile(
            title: Bone.text(
              width: 80,
            ),
            subtitle: Bone.text(
              width: 180,
            ),
            leading: Bone.icon(
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
