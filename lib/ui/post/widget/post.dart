import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_detail/category_sottie.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.model,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(CustomRouter.findDetailPath),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: 120 * hu,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: const Border(top: BorderSide(width: 0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.pencil),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(CategorySottie.study.name),
                    ],
                  ),
                  Text("${model.currentMemberCount}/${model.maxMemberCount}"),
                ],
              ),
              SizedBox(height: 10 * hu),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 110 * wu,
                    height: 70 * hu,
                    child: const Center(
                      child: Text("썸네일"),
                    ),
                  ),
                  SizedBox(
                    width: 150 * wu,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * hu,
                          ),
                        ),
                        SizedBox(height: 10 * hu),
                        Text(
                          model.location,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11 * hu,
                          ),
                        ),
                        Text(
                          model.date,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11 * hu,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
