import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class PhotoMagnificationScreen extends StatelessWidget {
  const PhotoMagnificationScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.whiteSilverColor,
          ),
        ),
      ),
      backgroundColor: Colors.black38,
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          imageBuilder:
              (_, imageProvider) =>
                  Image(image: imageProvider, fit: BoxFit.cover),
          placeholder:
              (_, __) => const Text(
                "이미지를 불러오는 중...",
                style: TextStyle(color: AppColors.whiteSilverColor),
              ),
          errorWidget: (_, __, ___) {
            return const Text(
              "이미지를 불러올 수 없습니다.",
              style: TextStyle(color: AppColors.whiteSilverColor),
            );
          },
        ),
      ),
    );
  }
}
