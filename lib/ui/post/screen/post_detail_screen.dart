import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final controller = PageController();
  List<Image>? images;

  // 더미
  final thumbnail = List.generate(
      5,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Center(
                child: Text(
              "Thumbnail $index",
              style: const TextStyle(color: Colors.black),
            )),
          ));

  @override
  void initState() {
    if (makePostDetailEntity.images != null) {
      images = makePostDetailEntity.images!.map((image) {
        return Image.file(
          File(image.path),
          fit: BoxFit.cover,
        );
      }).toList();
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                makePostDetailEntity.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  if (images != null)
                    SizedBox(
                      height: 250 * hu,
                      child: PageView.builder(
                        controller: controller,
                        itemBuilder: (_, index) {
                          return images![index % images!.length];
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  if (images != null)
                    SmoothPageIndicator(
                      controller: controller,
                      count: images!.length,
                      effect: const WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: mainBrownColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                makePostDetailEntity.content,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("참여 인원: ${makePostDetailEntity.numOfMember}"),
                    Text(
                        "날짜: ${makePostDetailEntity.date == null ? "날짜 정보 없음" : makePostDetailEntity.date!.toString()}"),
                    Text("장소: ${makePostDetailEntity.location.name}"),
                    Text("나이: ${makePostDetailEntity.ageRange.toString()}"),
                    Text("매너온도: ${makePostDetailEntity.manner}도 이상"),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBrownColor,
                        minimumSize: const Size(100, 65),
                      ),
                      onPressed: widget.onPressed,
                      child: Text(
                        widget.buttonTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: mainSilverColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
