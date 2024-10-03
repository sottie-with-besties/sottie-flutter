import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class PhotoMagnificationScreen extends StatelessWidget {
  const PhotoMagnificationScreen({
    super.key,
    required this.imageUrl,
  });

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
            color: mainSilverColor,
          ),
        ),
      ),
      backgroundColor: Colors.black38,
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return const Center(
              child: Text(
                "이미지를 불러올 수 없습니다.",
                style: TextStyle(
                  color: mainSilverColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
