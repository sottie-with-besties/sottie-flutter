import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/domain/post/classification_entity/category.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.model,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mainSilverColor,
      child: InkWell(
        onTap: () => context.push(CustomRouter.findDetailPath),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 120 * hu,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
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
                        Text(
                            "${model.currentMemberCount}/${model.maxMemberCount}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                          width: 190,
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
                              const SizedBox(
                                height: 10,
                              ),
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
